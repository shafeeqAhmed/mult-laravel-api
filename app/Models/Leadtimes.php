<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Leadtimes extends Model
{
    use HasFactory;
    protected $table = 'leadtimes';
     protected $fillable = [
        'leadtime_date_from',
        'leadtime_date_to',
        'user_id'
    ];
}
