<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Models\SellerRequest;

class SellerRequests extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
       return [
            'seller_email' => 'required|email|unique:seller_requests',
            'seller_phone_number' => 'string|max:11',
            'seller_name' => 'required|string|max:50',
            'seller_mobile_number' => 'required|max:50',
            'seller_company_name' => 'required|string|max:50',
            'seller_standard' => 'required',
            'seller_monthly_revnue' => 'required',
            'seller_business_registration_no' => 'nullable',
            'seller_business_owner_fname' => 'required',
            'seller_business_owner_lname' => 'required',
            'seller_business_owner_email' => 'required',
            'seller_total_products' => 'required',
            'seller_product_description' => 'nullable',
            'seller_website' => 'nullable',
            'seller_social_media' => 'nullable',
            'seller_comments' => 'nullable',

        ];
    }
}
