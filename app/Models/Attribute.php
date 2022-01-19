<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attribute extends Model
{
    use HasFactory;
    protected $fillable = ['title', 'tags', 'fields', 'isFileAble', 'status'];
    public function setIsFileAbleAttribute($value)
    {
        $this->attributes['is_file_able'] = $value == true ? 1 : 0;
    }
    public function getIsFileAbleAttribute($value)
    {
        return $value == 1 ? true : false;
    }
}
