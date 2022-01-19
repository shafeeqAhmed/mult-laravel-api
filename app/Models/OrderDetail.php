<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class OrderDetail extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'order_detail';
    protected $fillable = [
        'admin_order_id',
        'seller_order_id',
        'seller_id',
        'product_id',
        'product_qty',
        'product_amount',
        'order_status',
        'item_order_no'
    ];
    protected $casts = [
        'created_at' => 'datetime:F d, Y',
    ];
}
