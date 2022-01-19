<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BankDetail extends Model
{
    use HasFactory;
     protected $table = 'bank_details';
     protected $fillable = [
        'bank_detail_firstname',
        'bank_detail_bank_name',
        'bank_detail_account_no',
        'bank_detail_branch_code',
        'bank_detail_file_name',
        'bank_detail_request_status',
        'user_id'
    ];
}
