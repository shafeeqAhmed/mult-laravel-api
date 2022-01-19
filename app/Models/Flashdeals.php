<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
// use CategoryAttribute;

class Flashdeals extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'flash_deals';
    protected $fillable = ["title", "start_date", "end_date", "status", "featured","timer_status","background_color","banner","slug"];
}
