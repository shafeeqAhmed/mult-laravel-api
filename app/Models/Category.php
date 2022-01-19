<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
// use CategoryAttribute;
use App\Models\Products;

class Category extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'categories';
    protected $fillable = ["parent_id", "level", "name", "commission_rate", "banner", "icon", "featured", "top", "slug", "bread_crumbs", "meta_title", "meta_description", "status"];

    public function setFeaturedAttribute($value)
    {
        $this->attributes['featured'] = $value ? true : false;
    }
    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id')
            ->select('id', 'name');
    }
    public function child()
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    }
    public function attribute()
    {
        return $this->hasMany(CategoryAttribute::class, 'attribute_id', 'id');
    }
    public function products()
    {
        return $this->hasMany(Products::class);
    }
}
