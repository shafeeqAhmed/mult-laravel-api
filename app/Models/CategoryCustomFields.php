<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryCustomFields extends Model
{
    use HasFactory;
    protected $fillable = ["custom_field_id", "category_id", "order_level", "user_id", "status"];
}
