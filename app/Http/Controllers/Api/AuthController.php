<?php

namespace App\Http\Controllers\Api;

use App\Actions\Fortify\CreateNewUser;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
// use Spatie\Permission\Models\
use Illuminate\Auth\Events\Registered;
use App\Http\Requests\EmailVerificationRequest;
use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Str;
use App\Models\User_balance;
use Exception;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'device_name' => 'required',
        ]);
        try{
            $user = User::where('email', $request->email)->first();
            if (!$user || !Hash::check($request->password, $user->password)) {
                return response()->json(['status' => false, 'message' => 'The provided credentials are incorrect.', 'data' => []]);
            }
            $detail['id'] = $user->id;
            $detail['fullName'] = $user->name;
            $detail['username'] = $user->name;
            $detail['is_reseller'] = $user->is_reseller;
            $detail['avatar'] = $user->profile_photo_path;
            $detail['email'] = $user->email;
            $detail['verifyKey'] = $user->email_verified_at;

            if (count($user->getRoleNames()) > 0) {
                $detail['role'] = $user->getRoleNames()[0];
            } else {
                $detail['role'] = 'seller';
            }

            $detail['ability'] = [
                [
                    'action' => 'manage',
                    'subject' => 'all'
                ]
            ];
            $detail['extras'] = [
                'eCommerceCartItemsCount' => 5
            ];


            $token = $user->createToken($request->device_name)->plainTextToken;

            $data['userData'] = $detail;
            $data['accessToken'] = $token;
            $data['refreshToken'] = $token;
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);

        } catch(Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);

        }


    }
    public function userDetail(Request $request)
    {


        $user = User::where('id', $request->user()->id)->first();
        $detail['id'] = $user->id;
        $detail['fullName'] = $user->name;
        $detail['username'] = $user->name;
        $detail['is_reseller'] = $user->is_reseller;
        $detail['avatar'] = url("storage/$user->profile_photo_path");
        $detail['email'] = $user->email;
        $detail['verifyKey'] = $user->email_verified_at;
        if (count($user->getRoleNames()) > 0) {
            $detail['role'] = $user->getRoleNames()[0];
        } else {
            $detail['role'] = 'seller';
        }
            $detail['usercall'] = 'test';

        $detail['ability'] = [
            [
                'action' => 'manage',
                'subject' => 'all'
            ]
        ];
        $detail['extras'] = [
            'eCommerceCartItemsCount' => 5
        ];


        // $token = $user->createToken('refresh')->plainTextToken;

        $data['user'] = $detail;
        // $data['accessToken'] = $token;
        // $data['refreshToken'] = $token;
        return response()->json(['status' => true, 'message' => '', 'data' => $data]);
    }

    public function register(Request $request)
    {
        $auth = new CreateNewUser();
        //    $data= $auth->create($request->all());
        event(new Registered($data = $auth->create($request->all())));
        $userType = 'customer';
        if ($request->baseDomain === 'admin') {
            $data->assignRole('admin');
            $userType = 'admin';
        } else if ($request->baseDomain === 'seller') {
            $data->assignRole('seller');
            $userType = 'seller';
        } else if ($request->baseDomain === 'customer') {
            $data->assignRole('customer');
            $userType = 'customer';
        }
        User_balance::create(['user_id'=>$data->id,'balance'=>1000,'user_type'=>$userType]);
        if ($auth) {
            return response()->json(['status' => true, 'message' => 'You have been register successfully', 'data' => []]);
        } else {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function resendVerificationEmail(Request $request)
    {
        if ($request->user()->hasVerifiedEmail()) {
            return $request->wantsJson()
                ? new JsonResponse('', 204)
                : redirect()->intended(config('fortify.home'));
        }

        $request->user()->sendEmailVerificationNotification();

        return response()->json(['status' => true, 'message' => 'Verfication email has been send to you, please check your mail Inbox', 'data' => []]);
    }

    public function VerificationEmail(EmailVerificationRequest $request)
    {
        if ($request->user()->hasVerifiedEmail()) {
            return response()->json(['status' => true, 'message' => 'Your email has been verified Successfully', 'data' => []]);
        } else {
            $request->fulfill();

            if ($request->user()->hasVerifiedEmail()) {
                return response()->json(['status' => true, 'message' => 'Your email has been verified Successfully', 'data' => []]);
            } else {
                return response()->json(['status' => false, 'message' => 'Your email has been verified Successfully', 'data' => []]);
            }
        }
    }
    public function forgotPassword(Request $request)
    {
        $request->validate(['email' => 'required|email']);
        $status = Password::sendResetLink(
            $request->only('email')
        );
        if ($status === Password::RESET_LINK_SENT) {

            return response()->json(['status' => true, 'message' => __($status), 'data' => []]);
        } else {
            return response()->json(['status' => false, 'message' => __($status), 'data' => []]);
        }
    }
    public function resetPassword(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:6|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ])->setRememberToken(Str::random(60));

                $user->save();

                event(new PasswordReset($user));
            }
        );

        if ($status === Password::PASSWORD_RESET) {
            return response()->json(['status' => true, 'message' => __($status), 'data' => []]);
        } else {
            return response()->json(['status' => false, 'message' => __($status), 'data' => []]);
        }
    }
    public function isVerifiedEmail(Request $request) {
        $verify = User::where('id', $request->user()->id)->value('email_verified_at');
        $data['isVerified'] = !is_null($verify);

        return response()->json(['status' => true, 'message' => '', 'data' => $data]);
    }
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
    }
    public function refresh(Request $request)
    {
        $data['accessToken'] = $request->user()->createToken('refresh_token')->plainTextToken;
        return response()->json(['status' => true, 'message' => '', 'data' => $data]);

    }
}
