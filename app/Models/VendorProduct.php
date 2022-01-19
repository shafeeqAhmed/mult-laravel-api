<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VendorProduct extends Model
{
    use HasFactory;
     protected $table = 'vendor_products';
      protected $fillable = [
        'msin',
        'seller_id',
        'product_id',
         'price',
        'cost',
        'selling_price',
         'qty',
        'low_qty_alert',
        'status',
        'list_status',
        'sku'
        ];
        public function product(){

          return $this->hasOne(Products::class,'id','product_id');
          
        }
}
