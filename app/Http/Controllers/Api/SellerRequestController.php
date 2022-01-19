<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SellerRequest;
use App\Actions\Fortify\CreateNewUser;
use Mail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Auth\Events\Registered;
use App\Models\User;
use App\Http\Requests\SellerRequests;
use App\Mail\DefaultMail;
use App\Models\User_balance;
class SellerRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $data['seller_requests'] = SellerRequest::when($request->q, function ($query, $q) {
                return $query->where('seller_name', 'LIKE', "%{$q}%")->orwhere('seller_email', 'LIKE', "%{$q}%")
                    ->orwhere('seller_company_name', 'LIKE', "%{$q}%")->orwhere('seller_request_status', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->paginate($request->perPage);

            return response()->json(['status' => true, 'message' => 'Seller Requests has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function changeStatus(Request $request)
    {

        try {
            $validated = $request->validate([
                'id' => 'required',
                'seller_request_status' => 'required',
            ]);
            $record = SellerRequest::where([
                'id' => $validated['id'],
            ])->update($validated);

            $seller = SellerRequest::find($validated['id']);

            $mail_data = new \stdClass;
            $mail_data->subject = 'Seller Request Status Changed!';
            $mail_data->seller_request_status = $seller->seller_request_status;
            $mail_data->seller_name = $seller->seller_name;
            $mail_data->file = 'seller_request';
            Mail::to($seller->seller_email)->send(new DefaultMail($mail_data));


            if ($validated['seller_request_status'] == 'Approved') {

                $user = User::where('email', '=', $seller->seller_email)->first();

                $user_arr = array();
                $user_arr['name'] = $seller->seller_name;
                $user_arr['email'] = $seller->seller_email;
                $user_arr['email_verified_at'] = now();
                $user_arr['terms'] = 'on';
                $orgionalPassword = Str::random(8);
                // $user_arr['password'] = Hash::make($orgionalPassword);
                $user_arr['password'] = $orgionalPassword;
                $user_arr['password_confirmation'] = $orgionalPassword;
                $auth = new CreateNewUser();

                if ($user) {

                    if (count($user->getRoleNames()) > 0) {

                        $array = json_decode(json_encode($user->getRoleNames()), true);

                        if (!in_array('seller', $array)) {
                            $user->assignRole('seller');
                            $user->password = $orgionalPassword;
                            $user->save();
                            User_balance::create(['user_id' => $user->id, 'balance' => 1000, 'user_type' => 'seller']);


                            $mail_data = new \stdClass;
                            $mail_data->subject = 'New Role Has been Created!';
                            $mail_data->name = $user->name;
                            $mail_data->email = $user->email;
                            $mail_data->password =  $orgionalPassword;
                            $mail_data->file = 'new_role';
                            Mail::to($user->email)->send(new DefaultMail($mail_data));

                         $seller_data['seller_request_id'] = $seller->id;
                         User::where('id',$user->id)->update($seller_data);
                        }
                    }
                } else {
                    $data = $auth->create($user_arr);
                    $data->markEmailAsVerified();
                    $data->assignRole('seller');
                    User_balance::create(['user_id' => $data->id, 'balance' => 1000, 'user_type' => 'seller']);
                    $mail_data = new \stdClass;
                    $mail_data->subject = 'New Seller Role Has been Created!';
                    $mail_data->name = $data->name;
                    $mail_data->email = $data->email;
                    $mail_data->password =  $orgionalPassword;
                    $mail_data->file = 'new_role';
                    Mail::to($data->email)->send(new DefaultMail($mail_data));

                    $seller_data['seller_request_id'] = $seller->id;
                    User::where('id', $data->id)->update($seller_data);

                }


             
            }

            return response()->json(['status' => true, 'message' => 'Seller Request Status has been changed successfully!', 'data' => []]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
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
    }

    public function storeSellerRequest(SellerRequests $request)
    {
        try {

            $validatedData = $request->validated();
            $validatedData['seller_request_status'] = 'Pending';

            SellerRequest::create($validatedData);
            return response()->json(['status' => true, 'message' => 'Seller Request has been added  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }



    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $data['seller_request_detail'] = SellerRequest::where('id', $id)->first();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //  return $id;
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
}
