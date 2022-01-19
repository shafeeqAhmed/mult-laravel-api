<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryAlias extends Model
{
    use HasFactory;
    protected $table = "category_alias";
    protected $filleable = ["google_category_id", "google_category_name"];
}
