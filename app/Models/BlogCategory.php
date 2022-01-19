<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
// use CategoryAttribute;

class BlogCategory extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'blog_categories';
    protected $fillable = ["category_name", "slug"]; 
}
