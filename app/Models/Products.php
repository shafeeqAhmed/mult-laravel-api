<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductImages;

class Products extends Model
{
    use HasFactory;
    protected $fillable = [
        'parent_id',
        'plid',
        'is_variant',
        'title',
        'sub_title',
        'added_by',
        'color',
        'price',
        'sku',
        'cost',
        'selling_price',
        'qty',
        'low_qty_alert',
        'description',
        'width',
        'height',
        'length',
        'volumetric_weight',
        'weight',
        'video_provider',
        'category_id',
        'status',
        'slug',
        'deleted_at',
        'variant_attribute',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function attribute()
    {
        return $this->hasMany(ProductVariantAttribute::class, 'product_id', 'id');
    }
    public function images()
    {
        return $this->hasMany(ProductImages::class, 'product_id', 'id');
    }
    public function variants()
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    }

    public function vendorProducts(){
        return $this->hasMany(VendorProduct::class,'product_id','id');
    }
    public function scopeCheapVendorProduct($query) {
        return $query->with(['variants' => function ($query1) {
            $query1->Join('vendor_products as pv', 'pv.product_id', '=', 'products.id')
            ->Join('product_images as pi', 'pi.product_id', '=', 'products.id')
            ->select(
                'products.title',
                'products.parent_id',
                'pv.selling_price',
                'pv.price',
                'pi.url')
            ->where('pi.is_primary', 1)
            ->where('pv.list_status', 'approved')
            ->where('pv.status', 'active')
            ->where('pv.selling_price', '!=', 0)
            ->where('pv.qty', '!=', 0)
            ->orderBy('pv.selling_price','asc');
        }]);
    }
    public function scopeRestrictionOfProduct($query) {
       return  $query->where('pi.is_primary', 1)
            ->where('pv.list_status', 'approved')
            ->where('pv.status', 'active')
            ->where('pv.price', '!=', 0)
            ->where('pv.selling_price', '!=',0)
            ->where('pv.qty', '!=', 0)
            ->where('products.is_variant', 0);
    }
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'created_at' => 'datetime:Y-m-d',
        'properties' => 'array'

    ];
}
