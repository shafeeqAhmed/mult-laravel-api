<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BusinessDetail extends Model
{
    use HasFactory;
      protected $table = 'business_details';
     protected $fillable = [
        'business_legal_name',
        'business_type',
        'business_registration_number',
        'business_account_file',
        'business_id_document',
        'business_bee_status',
        'business_out_office_from',
        'business_out_office_to',
        'user_id'
    ];
}
