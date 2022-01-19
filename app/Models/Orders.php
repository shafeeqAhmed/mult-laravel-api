<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    use HasFactory;
     protected $table = 'orders';
     protected $fillable = [
        'order_customer_id',
        'order_product_id',
        'order_product_qty',
        'order_product_price',
         'order_total_price'
    ];

}
