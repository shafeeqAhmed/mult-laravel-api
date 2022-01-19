<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Countries extends Model
{
    use HasFactory;
     protected $table = 'countries';
     protected $fillable = [
        'country_name',
        'country_sort_name',
        'country_phone_code'
    ];
}
