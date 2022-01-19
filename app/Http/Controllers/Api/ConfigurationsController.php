<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Exception;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use App\Models\BusinessSetting;
use Mail;
use App\Mail\DefaultMail;

use function BenTools\CartesianProduct\cartesian_product;

class ConfigurationsController extends Controller
{
    
   
	
	public function smpt_fetch()
    { 
	   
        try {
			$smtpArray = array(
			'type'=>env('MAIL_MAILER'),
			'mailhost'=>env('MAIL_HOST'),
			'myport'=>env('MAIL_PORT'),
			'username'=>env('MAIL_USERNAME'),
			'password'=>env('MAIL_PASSWORD'),
			'mail_encryption'=>env('MAIL_ENCRYPTION'),
			'from_mail_address'=>env('MAIL_FROM_ADDRESS'),
			'from_name'=>env('MAIL_FROM_NAME'),
			
			);
            return response()->json(['status' => true, 'message' => 'SMTP Fetch  successfully', 'data'=>$smtpArray]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        }
    }	
    public function social_media_login()
    { 
	   
        try {
			$loginDetails = array(
			'GOOGLE_CLIENT_ID'=>env('GOOGLE_CLIENT_ID'),
			'GOOGLE_CLIENT_SECRET'=>env('GOOGLE_CLIENT_SECRET'),
			'FACEBOOK_CLIENT_ID'=>env('FACEBOOK_CLIENT_ID'),
			'FACEBOOK_CLIENT_SECRET'=>env('FACEBOOK_CLIENT_SECRET'),
			'TWITTER_CLIENT_ID'=>env('TWITTER_CLIENT_ID'),
			'TWITTER_CLIENT_SECRET'=>env('TWITTER_CLIENT_SECRET'),
			
			);
            return response()->json(['status' => true, 'message' => 'Social Media Login Fetch  successfully', 'data'=>$loginDetails]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        }
    }
    public function fetch_recaptcha()
    { 
	   
        // try {
            $captchav2_status = BusinessSetting::where('type', 'google_recaptcha')->pluck('value');
            $captchav3_status = BusinessSetting::where('type', 'google_recaptcha_v3')->pluck('value');
			$loginDetails = array(
			'CAPTCHA_KEY'=>env('CAPTCHA_KEY'),
			'CAPTCHA_SITE_KEY'=>env('CAPTCHA_SITE_KEY'),
			'CAPTCHA_SECRET_KEY'=>env('CAPTCHA_SECRET_KEY'),
            'captchav2_status'=>$captchav2_status[0],
            'captchav3_status'=>$captchav3_status[0],
			
			);
            return response()->json(['status' => true, 'message' => 'Social Media Login Fetch  successfully', 'data'=>$loginDetails]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        // }
    }
	public function smpt_update (Request $request)
    { 
	   
       
        try {
            $input = $request->all();
            foreach ($input as $key => $type) {
                $this->overWriteEnvFile($key, $type);
            }
            return response()->json(['status' => true, 'message' => 'SMTP has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        }
    }	
    public function google_login_update (Request $request)
    { 
	   
       
        try {
            $input = $request->all();
            foreach ($input as $key => $type) {
                $this->overWriteEnvFile($key, $type);
            }
            return response()->json(['status' => true, 'message' => 'Google Login has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        }
    }
     public function twitter_login_update (Request $request)
    { 
	   
       
        try {
            $input = $request->all();
            foreach ($input as $key => $type) {
                $this->overWriteEnvFile($key, $type);
            }
            return response()->json(['status' => true, 'message' => 'Twitter Login has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        }
    }
     public function facebook_login_update (Request $request)
    { 
	   
       
        try {
            $input = $request->all();
            foreach ($input as $key => $type) {
                $this->overWriteEnvFile($key, $type);
            }
            return response()->json(['status' => true, 'message' => 'Facebook Login has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        }
    }
    public function overWriteEnvFile($type, $val)
    {
        if(env('DEMO_MODE') != 'On'){
            $path = base_path('.env');
            if (file_exists($path)) {
                $val = '"'.trim($val).'"';
                if(is_numeric(strpos(file_get_contents($path), $type)) && strpos(file_get_contents($path), $type) >= 0){
                    file_put_contents($path, str_replace(
                        $type.'="'.env($type).'"', $type.'='.$val, file_get_contents($path)
                    ));
                }
                else{
                    file_put_contents($path, file_get_contents($path)."\r\n".$type.'='.$val);
                }
            }
        }
    }
    public function google_recaptcha_update(Request $request)
    {
        try {
            $input = $request->all();
            unset($input['v2_status']);
            foreach ($input as $key => $type) {
                $this->overWriteEnvFile($key, $type);
            }
            
        $business_settings = BusinessSetting::where('type', 'google_recaptcha')->first();
        $business_settings->value = ($request->v2_status)== 'true' ? 1:0;
        $business_settings->save();
            return response()->json(['status' => true, 'message' => 'Google Recaptcha v2 has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        }


    }
	public function google_recaptcha_v3_update(Request $request)
    {
        try {
        $input = $request->all();
        unset($input['v2_status']);
        foreach ($input as $key => $type) {
            $this->overWriteEnvFile($key, $type);
        }
        $business_settings = BusinessSetting::where('type', 'google_recaptcha_v3')->first();
        $business_settings->value = ($request->v3_status)== 'true' ? 1:0;
        $business_settings->save();

        return response()->json(['status' => true, 'message' => 'Google Recaptcha v3 has been updated  successfully', 'data' => []]);
    } catch (Exception $e) {
        return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
    }
    }
    public function fetch_setting(){
        try {
			$settings = array(
			'site_name'=>get_setting('site_name'),
			'system_logo_white'=>get_setting('system_logo_white'),
			'system_logo_black'=>get_setting('system_logo_black') ,
			'TimeZone'=>app_timezone(),
			'admin_login_background'=>get_setting('admin_login_background'),
			
			);
            return response()->json(['status' => true, 'message' => 'Settings Fetch  successfully', 'data'=>$settings]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        }
    }
    public function setting_update(Request $request)
    {
        try {
        $input = $request->all();
        foreach ($input as $key => $type) {
            if($type == 'site_name'){
                $this->overWriteEnvFile('APP_NAME', $type);
            }
            $business_settings = BusinessSetting::where('type', $key)->first();
            if($business_settings!=null){
                if($type=='system_logo_white'){
                   
                    $business_settings->value =  uploadImage('system_logo_white', 'general/setting', 300, 300);
                }
                else if($type=='system_logo_black'){
                   
                    $business_settings->value =  uploadImage('system_logo_black', 'general/setting', 300, 300);
                }
                else if($type=='admin_login_background'){
                   
                    $business_settings->value =  uploadImage('admin_login_background', 'general/setting', 1300, 650);
                }
                else{
                    $business_settings->value =$type;
                }
                
                $business_settings->save();
            }
            else{
                $business_settings = new BusinessSetting;
                $business_settings->type = $key;
                $business_settings->value = $type;
                $business_settings->save();
            }
        }
        return response()->json(['status' => true, 'message' => 'Setting has been updated  successfully', 'data' => []]);

    } catch (Exception $e) {
        return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
    }
    }
    public function send_email(Request $request){
       try {
        $email = $request->email;
        $data = array(
            'msg'=>'this is test email ',
            'subject'=>'test email',
            'file'=>'test_email'
        );
        Mail::to($email)
        ->send(new DefaultMail(json_encode($data)));
        return response()->json(['status' => true, 'message' => 'Email has been sent  successfully', 'data' => []]);
    } catch (Exception $e) {
        return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
    }
    }

}
