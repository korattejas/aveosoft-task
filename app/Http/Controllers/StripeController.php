<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\WalletStoreRequest;
use App\Models\Wallet;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class StripeController extends Controller
{
    public function addwallet( WalletStoreRequest $request )
    {
        $user = 6; //by default one user and id 6

        $array = [
            'card_number' => $request['card_number'],
            'exp_month'   => $request['exp_month'],
            'exp_year'    => $request['exp_year'],
            'cvc'         => $request['cvc'],
            'amount'      => $request['amount'],
        ];
        $result = $this->payment($array);

        $userDonation = new Wallet();
        $userDonation->user_id = $user;
        $userDonation->name = $request['name'];
        $userDonation->holder_type = $request['holder_type'];
        $userDonation->slug = $request['slug'];
        $userDonation->description = $request['description'];
        $userDonation->balance = $request['balance'];
        $userDonation->save();

        return response()->json([
            'message' => "User Wallet Added Successfully",
        ]);
    }

    public function payment( $array )
    {
        $payment_gateway = DB::table('payment_gateways')->where('status', 'active')->first();
        try {
            $stripe = new \Stripe\StripeClient(
                $payment_gateway->secret_key
            );
            $result = $stripe->paymentMethods->create([
                'type'            => 'card',
                'card'            => [
                    'number'    => $array['card_number'],
                    'exp_month' => $array['exp_month'],
                    'exp_year'  => $array['exp_year'],
                    'cvc'       => $array['cvc'],
                ],
            ]);

            $payment = $stripe->paymentIntents->create([
                'amount'         => $array['amount'],
                'currency'       => 'usd',
                'payment_method' => $result->id,
            ]);
            return [
                'success'    => true,
                'payment_id' => $payment->id
            ];

        } catch (\Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }

    }

}
