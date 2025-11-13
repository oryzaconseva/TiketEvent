<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Event extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'location',
        'date',
        'price',
        'quota',
        'poster_image',
    ];

    protected $appends = ['poster_image_url'];

    public function getPosterImageUrlAttribute()
    {
        if ($this->poster_image) {
            $apiUrl = config('app.api_url');
            return $apiUrl . '/api/storage/' . $this->poster_image;
        }

        return "https://via.placeholder.com/300.png?text=No+Image";
    }
}
