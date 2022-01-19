<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Transaction_type extends Model
{
    use HasFactory;
    use SoftDeletes;
      protected $table = 'transaction_types';
      protected $fillable = [
        'title',
        'description'
        ];
}
