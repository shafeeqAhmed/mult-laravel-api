<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class SellerOrders extends Model
{
    use HasFactory;
    use SoftDeletes;

      protected $table = 'seller_orders';
      protected $fillable = [
        'customer_id',
        'seller_id',
        'admin_order_id',
        'unique_no',
        'total_product_amount',
        'total_product_qty',
        'order_status'
        ];
    public function detail(){
        return $this->hasMany(OrderDetail::class, 'seller_order_id','id');
    }
    public function order_detail()
    {
        return $this->hasMany(OrderDetail::class, 'seller_order_id', 'id')
        ->join('vendor_products as pv', 'pv.product_id', '=', 'order_detail.product_id')
        ->join('products as p', 'p.id', '=', 'pv.product_id')
        
        ->join('product_images as pi', 'pi.product_id', '=', 'pv.product_id')
            ->where('pi.is_primary', 1)
            ->select('order_detail.*', 'p.title as product_title', 'pi.url as product_image');

    }
    protected $casts = [
        'created_at' => 'datetime:F d, Y',
    ];
}
