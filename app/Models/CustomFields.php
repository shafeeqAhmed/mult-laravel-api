<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomFields extends Model
{
    protected $fillable = ['title', 'collapse', 'description', 'is_grouped', 'fields', 'deleted_at'];
    use HasFactory;
}
