<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Models\BankDetail;
use App\Models\Leadtimes;
use Exception;

class BankDetailController extends Controller
{
     public function getBankDetail($id)
    {
        try {
            $data['bank_detail'] = BankDetail::where('user_id', $id)->first();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function updateBankDetail(Request $request)
    {
        $request->validate([
            'bank_detail_firstname' => 'required',
            'bank_detail_bank_name' => 'required',
            'bank_detail_account_no' => 'required',
            'bank_detail_branch_code' => 'required',
            'file' => 'required|mimes:jpg,jpeg,png,csv,txt,xlx,xls,pdf'
        ]);

          
            if($request->file()) {

            $file_name = $request->file->getClientOriginalName();
            $file_path = $request->file('file')->storeAs('uploads', $file_name, 'public');
            $generated_new_name = time() . '.' . $request->file->getClientOriginalExtension();
            $request->file->move('/storage/' . $file_path, $generated_new_name);
            $Detail['bank_detail_file_name'] = $file_name;
            }

        $Detail['bank_detail_firstname'] = $request->bank_detail_firstname;
        $Detail['bank_detail_bank_name'] = $request->bank_detail_bank_name;
        $Detail['bank_detail_account_no'] = $request->bank_detail_account_no;
        $Detail['bank_detail_branch_code'] = $request->bank_detail_branch_code;
       
        $BankDetail = BankDetail::where('user_id',  $request->id)->first();
        if(!$BankDetail){
        
        $Detail['bank_detail_request_status'] = 'Pending';
        $Detail['user_id'] =$request->id;

        $user_detail_id=BankDetail::create($Detail);
        }else{
              BankDetail::where('user_id', $request->id)->update($Detail);
        }
        
       return response()->json(['status' => true, 'message' => 'Bank Detail has been Updated successfully!', 'data' => []]);
    }

    public function getOutOfficeDates($id)
    {
        try {
            $data['lead_time'] = Leadtimes::where('user_id', $id)->first();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


      public function updateOutOfficeDetail(Request $request)
    {
        $request->validate([
            'leadtime_date_from' => 'required',
            'leadtime_date_to' => 'required',
        ]);

         
        $Detail['leadtime_date_from'] = $request->leadtime_date_from;
        $Detail['leadtime_date_to'] = $request->leadtime_date_to;
       
        $Leadtimes = Leadtimes::where('user_id',  $request->id)->first();
        if(!$Leadtimes){
        
        $Detail['user_id'] =$request->id;

        $user_detail_id=Leadtimes::create($Detail);
        }else{
              Leadtimes::where('user_id', $request->id)->update($Detail);
        }
        
       return response()->json(['status' => true, 'message' => 'Out Office Detail has been Updated successfully!', 'data' => []]);
    }



}
