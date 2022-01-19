<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AdminOrders extends Model
{
    use HasFactory;
    use SoftDeletes;

      protected $table = 'admin_orders';
      protected $fillable = [
        'customer_id',
        'unique_no',
        'total_product_amount',
        'total_product_qty',
        'order_status',
        'customer_order_no'

        ];
    public function sellers() {
        return $this->hasMany(SellerOrders::class, 'admin_order_id', 'id')
        ->join('users as u','u.id','=', 'seller_orders.seller_id')
        ->select('seller_orders.*','u.name as seller_name');
    }
    public function admin_details() {
        return $this->hasMany(OrderDetail::class, 'admin_order_id', 'id')
        ->join('products as p', 'p.id', '=', 'order_detail.product_id')
        ->join('product_images as pi', 'pi.product_id', '=', 'p.id')
            ->where('pi.is_primary', 1)
            ->select('order_detail.*', 'p.title as product_title', 'pi.url as product_image');
    }
    protected $casts = [
        'created_at' => 'datetime:F d, Y',
    ];
}
