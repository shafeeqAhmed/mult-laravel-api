<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User_balance extends Model
{
    use HasFactory;
     protected $table = 'user_balances';
      protected $fillable = [
        'user_id',
        'balance',
        'user_type'
        ];
}
