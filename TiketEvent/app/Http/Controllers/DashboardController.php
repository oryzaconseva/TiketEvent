<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class DashboardController extends Controller
{
    protected $apiStatsUrl = 'http://127.0.0.1:8001/api/admin/stats';
    protected $apiBookingsUrl = 'http://127.0.0.1:8001/api/bookings';

    public function index()
    {
        try {
            $statsResponse = Http::get($this->apiStatsUrl);
            $stats = $statsResponse->successful() ? $statsResponse->json() : [
                'total_events' => 'Error',
                'total_bookings' => 'Error',
                'pending_bookings' => 'Error',
            ];

            $bookingsResponse = Http::get($this->apiBookingsUrl, ['limit' => 5]);
            $recentBookings = $bookingsResponse->successful() ? $bookingsResponse->json() : [];

            return view('dashboard', [
                'stats' => $stats,
                'recentBookings' => $recentBookings,
            ]);

        } catch (\Exception $e) {
            Log::error('Gagal mengambil data dashboard: ' . $e->getMessage());
            return view('dashboard', [
                'stats' => [
                    'total_events' => 'N/A',
                    'total_bookings' => 'N/A',
                    'pending_bookings' => 'N/A',
                ],
                'recentBookings' => [],
            ]);
        }
    }
}
