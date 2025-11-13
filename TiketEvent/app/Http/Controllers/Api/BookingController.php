<?php

namespace App\Http\Controllers\Api;

use App\Models\Event;
use App\Models\Booking;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BookingController extends Controller
{
    /**
     * fungsi web
     */
    public function index(Request $request)
    {
        $query = Booking::with('user', 'event')
                    ->orderBy('created_at', 'desc');

        if ($request->has('limit')) {
            $query->limit($request->query('limit'));
    }

        $bookings = $query->get();
        return response()->json($bookings);
    }

    /**
     * fungsi flutter
     */
    public function store(Request $request)
    {
        $user = $request->user();
        $validated = $request->validate([
            'event_id' => 'required|exists:events,id',
            'quantity' => 'required|integer|min:1',
        ]);

        $event = Event::find($validated['event_id']);
        if ($event->quota < $validated['quantity']) {
            return response()->json(['message' => 'Maaf, kuota tidak mencukupi.'], 400);
        }

        $totalPrice = $event->price * $validated['quantity'];

        $booking = Booking::create([
            'user_id' => $user->id, //
            'event_id' => $validated['event_id'],
            'quantity' => $validated['quantity'],
            'total_price' => $totalPrice,
            'status' => 'pending',
        ]);

        $event->quota = $event->quota - $validated['quantity'];
        $event->save();

        return response()->json($booking, 201);
    }


    /**
     * ambil riwayat
     */
    public function getMyBookings(Request $request)
    {
        $user = $request->user();

        $bookings = Booking::with('event')
                            ->where('user_id', $user->id)
                            ->orderBy('created_at', 'desc')
                            ->get();

        return response()->json($bookings);
    }

    public function updateStatus(Request $request, Booking $booking)
    {
        $validated = $request->validate([
            'status' => 'required|string|in:pending,confirmed,cancelled'
        ]);

        $booking->status = $validated['status'];
        $booking->save();

        return response()->json($booking);
    }
}
