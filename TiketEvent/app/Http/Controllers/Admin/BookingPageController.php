<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class BookingPageController extends Controller
{
    protected $apiUrl = 'http://127.0.0.1:8001/api/bookings';

    /**
     * Tampilkan halaman "Daftar Pemesan"
     */
    public function index()
    {
        $response = Http::get($this->apiUrl);
        $bookings = $response->json();

        return view('admin.bookings.index', ['bookings' => $bookings]);
    }

    public function updateStatus(Request $request, $id)
    {
        $validated = $request->validate([
            'status' => 'required|string|in:pending,confirmed,cancelled'
        ]);

        Http::patch($this->apiUrl . '/' . $id . '/status', [
            'status' => $validated['status']
        ]);

        return redirect()->route('admin.bookings.index')->with('success', 'Status booking berhasil di-update!');
    }
}
