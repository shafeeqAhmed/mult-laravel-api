<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FlashdealProduct extends Model
{
    use HasFactory;
    use HasFactory;
    use SoftDeletes;

    protected $table = 'flash_deal_products';
    protected $fillable = ["flash_deal_id", "product_id", "discount", "discount_type"];
}
