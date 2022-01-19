<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Transaction_type;
use App\Models\SellerOrders;

class Transactions extends Model
{
    use HasFactory;
     use SoftDeletes;
      protected $table = 'transactions';
      protected $fillable = [
        'transistion_type_id',
        'admin_order_id',
        'seller_order_id',
        'order_detail_id',
        'user_id',
        'transaction_no',
        'transaction_description',
        'order_amount',
        'comission_paid',
        'qty',
        'current_balance',
        'available_balance',
        'user_type',
        'transaction_type'
        ];

        protected $casts=[
         'created_at'=>'datetime:F d, Y',
        ];
         public function transaction_type()
        {
            return $this->belongsTo(Transaction_type::class,'id');
        }

         public function sellerOrder()
        {
        
            return $this->belongsTo(SellerOrders::class,'seller_order_id','id');
        }

        public function orderDetail()
        {
        
            return $this->belongsTo(OrderDetail::class,'order_detail_id','id');
        }
}
