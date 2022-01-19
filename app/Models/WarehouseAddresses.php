<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WarehouseAddresses extends Model
{
    use HasFactory;
     protected $table = 'warehouse_addresses';
     protected $fillable = [
        'warehouse_address_recipient_name',
        'warehouse_address_street_no',
        'warehouse_address_street_name',
        'warehouse_address_suburb',
        'warehouse_address_city',
        'warehouse_address_country_id',
        'warehouse_address_postal_code',
        'user_id'
    ];

      public function country()
    {
        return $this->hasOne(Countries::class,'country_id','warehouse_address_country_id');
    }
}
