<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;


class WalletStoreRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'balance'  => 'required|numeric',
        ];
    }

    public function failedValidation( Validator $validator )
    {
        throw new HttpResponseException(response()->json([
            'message' => $validator->errors()->first()
        ], 422));
    }
}
