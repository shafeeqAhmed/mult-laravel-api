<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Addresses extends Model
{
    use HasFactory;
     protected $table = 'addresses';
     protected $fillable = [
        'address_recipient_name',
        'address_street_no',
        'address_street_name',
        'address_suburb',
        'address_city',
        'address_country_id',
        'address_postal_code',
        'user_id'
    ];

      public function country()
    {
        return $this->hasOne(Countries::class,'country_id','address_country_id');
    }
}
