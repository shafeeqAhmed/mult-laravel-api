<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserDetail;
use Exception;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getUsers(Request $request)
    {
        try {
            $data['users'] = User::when($request->q, function ($query, $q) {
                return $query->where('users.name', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->when($request->type, function ($query, $request) {
                    return $query->where('roles.name', $request);
                })
                ->join('model_has_roles as mhr', 'mhr.model_id', '=', 'users.id')
                ->join('roles', 'roles.id', '=', 'mhr.role_id')
                ->select('users.id', 'users.name', 'users.email', 'users.is_reseller', 'users.profile_photo_path', 'users.product_auto_approved','users.product_on_hold', 'roles.name as role_name')
                ->paginate($request->perPage);
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function getUserDetail($id)
    {
        try {
            $data['user'] = User::with('detail')->where('id', $id)->first();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function updateProfile(Request $request)
    {
        $request->validate([
            'firstName' => 'required',
            'lastName' => 'required',
            'email' => 'email',
            'title' => 'required',
            'mobile_number' => 'required',
            'phone_number' => 'required',
        ]);

        $record = User::where([
                'id' => $request->id,
        ])->update(['email' => $request->email]);

        $Detail['firstName'] = $request->firstName;
        $Detail['lastName'] = $request->lastName;
        $Detail['title'] = $request->title;
        $Detail['mobile_number'] = $request->mobile_number;
        $Detail['phone_number'] = $request->phone_number;

        $UserDetail = UserDetail::where('user_id',  $request->id)->first();
        if(!$UserDetail){
        $Detail['user_id'] =  $request->id;
        $Detail['language'] = 'en';
        $Detail['currency'] = 'PKR';
        $Detail['timezone'] = 'Asia/Karachi';
        $Detail['country_locale'] = 'en';
        $user_detail_id=UserDetail::create($Detail);
        }else{
              UserDetail::where('user_id', $request->id)->update($Detail);
        }

       return response()->json(['status' => true, 'message' => 'Prfile has been Updated successfully!', 'data' => []]);
    }
    public function sellerProductPermission(Request $request)
    {
        try {
            $request->validate([
                'id' => 'required',
                'status' => 'required',
            ]);
            User::where('id',$request->id)->update(['product_auto_approved'=>$request->status]);
            return response()->json(['status' => true, 'message' => 'Permission updated Successfully!', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function fetchusers(Request $request)
    {
        try {
        $data['user'] = User::select('email')->get();
        return response()->json(['status' => true, 'message' => 'Subscribers has been collect successfully', 'data' => $data]);

        }
        catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function sellerProductReselling(Request $request)
    {
        try {
            $request->validate([
                'id' => 'required',
                'status' => 'required',
            ]);
            User::where('id',$request->id)->update(['is_reseller'=>$request->status]);
            return response()->json(['status' => true, 'message' => 'Reselling Permission updated Successfully!', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


        public function sellerProductHoldPermission(Request $request)
    {
        try {
            $request->validate([
                'id' => 'required',
                'status' => 'required',
            ]);
            User::where('id',$request->id)->update(['product_on_hold'=>$request->status]);
            return response()->json(['status' => true, 'message' => 'On hold Permission updated Successfully!', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function getSellerDetail(Request $request)
    {


        try {
            $data['user'] = User::join('model_has_roles as mhr', 'mhr.model_id', '=', 'users.id')
            ->join('roles', 'roles.id','=','mhr.role_id')
            ->where('roles.name','seller')
            ->where('users.id',$request->user()->id)
            ->pluck('users.product_auto_approved');
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function getSellerPermission(Request $request)
    {


        try {
            $data['permission'] = User::join('model_has_roles as mhr', 'mhr.model_id', '=', 'users.id')
            ->join('roles', 'roles.id', '=', 'mhr.role_id')
            ->where('roles.name', 'seller')
            ->where('users.id', $request->user()->id)
                ->select('users.product_auto_approved', 'users.product_on_hold', 'users.is_reseller')
                ->first();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
}
