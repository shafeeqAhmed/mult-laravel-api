<?php

use App\Models\ExchangeRate;
use App\Models\UserDetail;
use App\Models\BusinessSetting;
use Carbon\Carbon;
use Illuminate\Contracts\Cache\Store;
use Illuminate\Support\Facades\Http;
use PragmaRX\Countries\Package\Services\Countries;
use IlluminateAgnostic\Collection\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManagerStatic as Image;

if (!function_exists('localizeDateTime')) {
    /**
     * @param $dateTime Carbon
     * @param null $timeZone
     * @return mixed
     */
    function localizeDateTime($dateTime)
    {
        $user = request()->user();
        if ($user && $user->detail) {

            $timeZone = $user->detail->timezone;
            return $dateTime->setTimeZone($timeZone);
        } else {
            return $dateTime;
        }
    }
}
if (!function_exists('get_setting')) {
    function get_setting($key, $default = null)
    {
        $setting = BusinessSetting::where('type', $key)->first();
        return $setting == null ? $default : $setting->value;
    }
}
if (!function_exists('currencyConversion')) {

    /**
     * @param $amount 'string'
     */
    function currencyConversion($amount, $base = null, $destination = null)
    {
        $user = request()->user();

        if (is_null($base)) {
            $base = config('app.base_currency');
        }
        if (is_null($destination)) {
            if ($user && $user->detail) {
                $destination = $user->detail->currency;
            } else {
                $destination = config('app.base_currency');
            }
        }
        $baseCurrency = ExchangeRate::where('code', $base)->first();
        $destinationCurrency = ExchangeRate::where('code', $destination)->first();

        if (!is_null($baseCurrency) && !is_null($destinationCurrency)) {
            return (floatval($amount) / floatval($baseCurrency->exchange_rate)) * $destinationCurrency->exchange_rate;
        }
    }

    if (!function_exists('formatNumber')) {
        function formatNumber($number)
        {
            $user = request()->user();
            if ($user && $user->detail) {
                $countryLocale = $user->detail->country_locale;
            } else {
                $countryLocale = config('app.locale');
            }
            $num = NumberFormatter::create($countryLocale, NumberFormatter::DECIMAL);
            return  $num->format($number);
        }
    }

    if (!function_exists('formatCurrency')) {
        function formatCurrency($amount)
        {
            $user = request()->user();
            if ($user && $user->detail) {
                $countryLocale = $user->detail->country_locale;
            } else {
                $countryLocale = config('app.locale');
            }
            $currency = NumberFormatter::create($countryLocale, NumberFormatter::CURRENCY);
            return $currency->format($amount);
        }
    }

    if (!function_exists('locationAgainstIp')) {
        function locationAgainstIp($ip)
        {
            $url = "http://api.ipstack.com/$ip?access_key=" . config('app.ip_stack_key');
            $response =  Http::get($url);
            return $response->collect();
        }
    }

    if (!function_exists('getCountryDetail')) {
        function getCountryDetail($country)
        {
            $countries = new Countries();
            $language = $countries->all()->where('name.common', $country)->first();
            $lang = '';
            $currency = '';
            $timezone = '';
            if (count($language['languages']) > 0) {
                $lang = substr($language['languages']->keys()->first(), 0, 2);
            }
            if (count($language['currencies']) > 0) {
                $currency = $language['currencies'][0];
            }
            $timezone = $countries->where('name.common', $country)->first()->hydrate('timezones')->timezones->first()->zone_name;

            return [
                'lang' => $lang,
                'timezone' => $timezone,
                'currency' => $currency,
                'country_locale' => strtolower($language['cca2'])

            ];
        }
    }

    if (!function_exists('loginSuccessCall')) {
        function loginSuccessCall($ip)
        {
            $response = locationAgainstIp($ip);
            if ($response->has('country_name')) {
                $detail = getCountryDetail($response['country_name']);
                $detail['language'] = $detail['lang'] ?? config('app.locale');
                $detail['timezone'] = $detail['timezone'] ?? config('app.timezone');
                $detail['currency'] = $detail['currency'] ?? 'USD123';
                $detail['country_locale'] = $detail['lang'] ?? config('app.locale');
            }
            $id = request()->user()->id;
            $detail['user_id'] = $id;
            UserDetail::updateOrCreate(['user_id' => $id], $detail);
        }
    }

    if (!function_exists('customFieldUploadImage')) {
        function customFieldUploadImage($file, $directory, int $width, int $height)
        {
            if ($file) {
                // $data2 = file_get_contents($file);
                // $type = $file->getClientOriginalExtension();
                // $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data2);
                $img = preg_replace('/^data:image\/\w+;base64,/', '', $file);
                // $imageName = Str::random(30) . '.' . $type;
                $imageName = Str::random(30) . '.png';
                $path = storage_path() . '/app/public/' . $directory;
                if (!File::isDirectory($path)) {
                    File::makeDirectory($path, 0777, true, true);
                }
                File::put($path . '/' . $imageName, base64_decode($img));
                $folder = 'public/storage/' . $directory . '/' . $imageName;
                if (isFileExist($directory, $folder)) {
                    $image = Image::make($folder)->resize($width, $height)->save();
                }

                return url("/$folder");
            } else {
                return '';
            }
        }
    }
    if (!function_exists('uploadImage')) {
        function uploadImage($key, $directory, int $width, int $height)
        {
            //  if (request($key)) {
            //     $path = storage_path('/app/public/' . $directory);
            //     if (!File::isDirectory($path)) {
            //         File::makeDirectory($path, 0777, true, true);
            //     }
            //     $imageName = time() . '.' . request($key)->extension();
            //     $path = $path . '/' . $imageName;
            //     Image::make(request($key))->resize($width, $height)->save($path);
            //     return url($directory . '/' . $imageName);
            // } else {
            //     return '';
            // }
            if (request($key)) {
                $data2 = file_get_contents(request($key));
                $type = request($key)->getClientOriginalExtension();
                $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data2);
                $img = preg_replace('/^data:image\/\w+;base64,/', '', $base64);
                $imageName = Str::random(30) . '.' . $type;
                $path = storage_path() . '/app/public/' . $directory;
                if (!File::isDirectory($path)) {
                    File::makeDirectory($path, 0777, true, true);
                }
                File::put($path . '/' . $imageName, base64_decode($img));
                $folder = 'public/storage/' . $directory . '/' . $imageName;
                if (isFileExist($directory, $folder)) {
                    $image = Image::make($folder)->resize($width, $height)->save();
                }
                return url("/$folder");
            } else {
                return '';
            }
        }
    }
    if (!function_exists('removeImage')) {
        function removeImage($directory, $old_img_url)
        {
            $arr = explode('/', $old_img_url);
            $path = 'public/' . $directory . '/' . end($arr);
            if (Storage::exists($path)) {
                Storage::delete($path);
            }
        }
    }
    if (!function_exists('isFileExist')) {
        function isFileExist($directory, $url)
        {
            $arr = explode('/', $url);
            $path = 'public/' . $directory . '/' . end($arr);
            return Storage::exists($path);
        }
    }
    function timezones(){
        return Timezones::timezonesToArray();
    }
    if (!function_exists('app_timezone')) {
        function app_timezone()
        {
            return config('app.timezone');
        }
    }
}
