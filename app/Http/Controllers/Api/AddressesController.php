<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Models\Addresses;
use App\Models\Countries;
use App\Models\BusinessDetail;
use App\Models\BillingAddresses;
use App\Models\WarehouseAddresses;

use Exception;

class AddressesController extends Controller
{
    public function getAddress($id)
    {
        try {
            $data2=array();
            $address = Addresses::with('country')->where('user_id', $id)->first();

            $countries = Countries::all();
            $data2 = array_merge(array('address'=>$address),array('countries'=>$countries));
            return response()->json(['status' => true, 'message' => '', 'data' => $data2]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
       }
    }


    public function getBillingAddress($id)
    {
        try {
            $data2=array();
            $address = BillingAddresses::with('country')->where('user_id', $id)->first();

            $countries = Countries::all();
            $data2 = array_merge(array('address'=>$address),array('countries'=>$countries));
            return response()->json(['status' => true, 'message' => '', 'data' => $data2]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
       }
    }

     public function getWarehouseAddress($id)
        {
            try {
                $data2=array();
                $address = WarehouseAddresses::with('country')->where('user_id', $id)->first();
                $countries = Countries::all();
                $data2 = array_merge(array('address'=>$address),array('countries'=>$countries));
                return response()->json(['status' => true, 'message' => '', 'data' => $data2]);
            } catch (Exception $e) {
                return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
           }
        }

    public function getBusinessDetail($id)
    {
        try {
            $data['business_detail'] = BusinessDetail::where('user_id', $id)->first();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function updateAddressDetail(Request $request)
    {
        $request->validate([
            'address_recipient_name' => 'required',
            'address_street_no' => 'required',
            'address_street_name' => 'required',
            'address_suburb' => 'required',
            'address_city' => 'required',
            'address_country_id' => 'required',
            'address_postal_code' => 'required',
        ]);


        $Detail['address_recipient_name'] = $request->address_recipient_name;
        $Detail['address_street_no'] = $request->address_street_no;
        $Detail['address_street_name'] = $request->address_street_name;
        $Detail['address_suburb'] = $request->address_suburb;
        $Detail['address_city'] = $request->address_city;
        $Detail['address_country_id'] = $request->address_country_id;
        $Detail['address_postal_code'] = $request->address_postal_code;


       
        $Addresses = Addresses::where('user_id',  $request->user_id)->first();
        if(!$Addresses){
        
        $Detail['user_id'] =$request->user_id;

        Addresses::create($Detail);
        }else{
        Addresses::where('user_id', $request->user_id)->update($Detail);
        }
        
       return response()->json(['status' => true, 'message' => 'Address has been Updated successfully!', 'data' => []]);
    }


     public function updateWarehouseAddressDetail(Request $request)
    {
        $request->validate([
            'warehouse_address_recipient_name' => 'required',
            'warehouse_address_street_no' => 'required',
            'warehouse_address_street_name' => 'required',
            'warehouse_address_suburb' => 'required',
            'warehouse_address_city' => 'required',
            'warehouse_address_country_id' => 'required',
            'warehouse_address_postal_code' => 'required',
        ]);


        $Detail['warehouse_address_recipient_name'] = $request->warehouse_address_recipient_name;
        $Detail['warehouse_address_street_no'] = $request->warehouse_address_street_no;
        $Detail['warehouse_address_street_name'] = $request->warehouse_address_street_name;
        $Detail['warehouse_address_suburb'] = $request->warehouse_address_suburb;
        $Detail['warehouse_address_city'] = $request->warehouse_address_city;
        $Detail['warehouse_address_country_id'] = $request->warehouse_address_country_id;
        $Detail['warehouse_address_postal_code'] = $request->warehouse_address_postal_code;
       
        $Addresses = WarehouseAddresses::where('user_id',  $request->user_id)->first();
        if(!$Addresses){
        
        $Detail['user_id'] =$request->user_id;

        WarehouseAddresses::create($Detail);
        }else{
        WarehouseAddresses::where('user_id', $request->user_id)->update($Detail);
        }
        
       return response()->json(['status' => true, 'message' => 'Warehouse Address has been Updated successfully!', 'data' => []]);
    }



     public function updateBillingAddressDetail(Request $request)
    {
        $request->validate([
            'billing_address_recipient_name' => 'required',
            'billing_address_street_no' => 'required',
            'billing_address_street_name' => 'required',
            'billing_address_suburb' => 'required',
            'billing_address_city' => 'required',
            'billing_address_country_id' => 'required',
            'billing_address_postal_code' => 'required',
        ]);


        $Detail['billing_address_recipient_name'] = $request->billing_address_recipient_name;
        $Detail['billing_address_street_no'] = $request->billing_address_street_no;
        $Detail['billing_address_street_name'] = $request->billing_address_street_name;
        $Detail['billing_address_suburb'] = $request->billing_address_suburb;
        $Detail['billing_address_city'] = $request->billing_address_city;
        $Detail['billing_address_country_id'] = $request->billing_address_country_id;
        $Detail['billing_address_postal_code'] = $request->billing_address_postal_code;
       
        $Addresses = BillingAddresses::where('user_id',  $request->user_id)->first();
        if(!$Addresses){
        
        $Detail['user_id'] =$request->user_id;

        BillingAddresses::create($Detail);
        }else{
        BillingAddresses::where('user_id', $request->user_id)->update($Detail);
        }
        
       return response()->json(['status' => true, 'message' => 'Billing Address has been Updated successfully!', 'data' => []]);
    }
}
