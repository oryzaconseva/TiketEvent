<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\Booking;
use Illuminate\Http\Request;

class DashboardStatsController extends Controller
{
    /**
     * Ambil data statistik asli dari database.
     */
    public function index()
    {
        $totalEvents = Event::count();
        $totalBookings = Booking::count();
        $pendingBookings = Booking::where('status', 'pending')->count();


        return response()->json([
            'total_events' => $totalEvents,
            'total_bookings' => $totalBookings,
            'pending_bookings' => $pendingBookings,
        ]);
    }
}
