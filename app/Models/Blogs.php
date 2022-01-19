<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
// use CategoryAttribute;

class Blogs extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'blogs';
    protected $fillable = ["title", "category_id", "short_description","description", "banner", "slug", "meta_title", "meta_description", "meta_keywords","status","meta_img"];

    public function getDescriptionAttribute($value)
    {
        return html_entity_decode($value);
    }
    protected $casts = [
        'created_at' => 'datetime:Y-m-d h:i:s',
    ];

}
