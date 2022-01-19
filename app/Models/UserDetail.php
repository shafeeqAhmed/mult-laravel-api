<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserDetail extends Model
{
    use HasFactory;
    protected $fillable=["user_id", "language", "currency", "timezone", "country_locale","firstName","lastName", "email", "title", "mobile_number","phone_number"
];
}
