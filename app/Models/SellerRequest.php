<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SellerRequest extends Model
{
    use HasFactory;
    protected $table = 'seller_requests';
     protected $fillable = [
        'seller_name',
        'seller_email',
        'seller_phone_number',
        'seller_mobile_number',
        'seller_company_name',
        'seller_request_status',

        'seller_standard',
        'seller_monthly_revnue',
        'seller_business_registration_no',
        'seller_business_owner_fname',
        'seller_business_owner_lname',
        'seller_business_owner_email',

        'seller_total_products',
        'seller_product_description',
        'seller_website',
        'seller_social_media',
        'seller_comments'
    ];
}