<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BusinessSetting;
use Exception;

class BusinessSettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    private function checkRequestFile($key, $value, $directory, $width, $height)
    {
        // hasFile
        // if ($key === $value && !is_null(request($key)) &&  request()->file($key)->isValid()) {
        if (request()->hasFile($key)) {
            $imageUrl = uploadImage($key, $directory, $width, $height);
            $oldFile = BusinessSetting::where('type', $key)->value('value');
            removeImage('admin/website', $oldFile);
            return $imageUrl;
        }
    }
    public function websiteSetupSettings(Request $request, $module)
    {
        try {
            $settings = $request->all();
            foreach ($settings as $key => $value) {
                if (request()->hasFile($key)) {
                    $value = uploadImage($key, 'admin/website', 153, 31);
                    $oldFile = BusinessSetting::where('type', $key)->value('value');
                    removeImage('admin/website', $oldFile);
                }
                if (!empty($value)) {
                    $businessSetting = BusinessSetting::where('type', $key)->where('module', $module)->first();
                    if ($businessSetting) {

                        $businessSetting->update(['value' => $value]);
                    } else {
                        BusinessSetting::create(['type' => $key, 'value' => $value, 'module' => $module]);
                    }
                }
            }
            return response()->json(['status' => true, 'message' => 'Data has been Updated successfully!', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function getWebsiteSetupSettings($module)
    {
        try {
            $settings=BusinessSetting::where('module', $module)->pluck('value', 'type')->all();
            $data['settings'] =$settings;
            $fb='';
             $Im='';
             $pint='';
             $twi='';
            if($module=='social_links_widget'){
                
                $facebook=$settings['facebook'];
                $facebook_path=parse_url($facebook);
                if(isset($facebook_path['path'])){
                $fb=parse_url($facebook_path['path']);
                $fb=$fb['path'];
                }
               
                $instagram=$settings['instagram'];
                $instagram_path=parse_url($instagram);
                if(isset($instagram_path['path'])){
                $Im=parse_url($instagram_path['path']);
                $Im=$Im['path'];
                }

                $twitter=$settings['twitter'];
                $twitter_path=parse_url($twitter);
                if(isset($twitter_path['path'])){
                $twi=parse_url($twitter_path['path']);
                $twi=$twi['path'];
                }

              
                $pinterest=$settings['pinterest'];
                $pinterest_path=parse_url($pinterest);
                if(isset($pinterest_path['path'])){
                $link=parse_url($pinterest_path['path']);
                $pint=$link['path'];
                }

                $data['settings']['facebook_short']=$fb;
                $data['settings']['instagram_short']=$Im;
                $data['settings']['twitter_short']=$twi;
                $data['settings']['pinterest_short']=$pint;
               
            }
            return response()->json(['status' => true, 'message' => 'Data has been Updated successfully!', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
}
