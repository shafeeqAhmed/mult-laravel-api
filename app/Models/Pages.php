<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
// use CategoryAttribute;

class Pages extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'pages';
    protected $fillable = ["title", "slug", "meta_title", "meta_description", "keywords","type","mata_image","content"]; 
}
