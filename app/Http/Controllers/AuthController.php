<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\SignUpRequest;
use App\Http\Requests\LogInRequest;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;






class AuthController extends Controller
{
     public function login( LogInRequest $request ): \Illuminate\Http\JsonResponse
    {
        $credentials = $request->only('email', 'password');

        if (!Auth::attempt($credentials)) {
            return response()->json([
                'message' => "Invalid Email And Password",
            ], 422);
        }
        $user = User::where(['email' => $request['email']])->orwhere(['name' => $request['email']])->first();

        if (!$user) {
            return response()->json([
                 'message' => "Invalid Email And Password",
            ], 422);
        }

        $this->addDeviceToken($user->id, $request['device_type'], $request['device_token']);

        $tokenResult = $user->createToken('authToken')->plainTextToken;

        return response()->json([
            'token'             => $tokenResult,
            'message' => "Login Successfully"
        ]);


    }


     public function signUp( SignUpRequest $request ): \Illuminate\Http\JsonResponse
    {
        $user = new User();
        $user->name = $request['name'];
        $user->email = $request['email'];
        $user->password = Hash::make($request['password']);
        $user->save();

        $tokenResult = $user->createToken('authToken')->plainTextToken;


        $this->addDeviceToken($user->id, $request['device_type'], $request['device_token']);

        return response()->json([
            'message' => "Added User",
            'token'   => $tokenResult
        ]);
    }

     public function addDeviceToken( $user_id, $device_type, $device_token ): bool
    {
        $this->deleteToken($device_token);
        DB::table('devices')->insert([
            'user_id'      => $user_id,
            'device_type'  => $device_type,
            'device_token' => $device_token,
        ]);
        return true;
    }

    public function deleteToken( $device_token ): bool
    {
        DB::table('devices')->where('device_token', $device_token)->delete();
        return true;
    }
}
