<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    /**
     * Kolom yang BOLEH diisi secara massal (WAJIB ADA).
     */
    protected $fillable = [
        'user_id',
        'event_id',
        'quantity',
        'total_price',
        'status',
    ];

    /**
     * Relasi ke model User (WAJIB ADA).
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Relasi ke model Event (WAJIB ADA).
     */
    public function event()
    {
        return $this->belongsTo(Event::class);
    }
}
