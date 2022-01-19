<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillingAddresses extends Model
{
    use HasFactory;
     protected $table = 'billing_addresses';
     protected $fillable = [
        'billing_address_recipient_name',
        'billing_address_street_no',
        'billing_address_street_name',
        'billing_address_city',
        'billing_address_country_id',
        'billing_address_postal_code',
        'billing_address_suburb',
        'user_id'
    ];

      public function country()
    {
        return $this->hasOne(Countries::class,'country_id','billing_address_country_id');
    }
}
