<?php

namespace App\Http\Controllers\Api;

use App\Models\Event;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class EventController extends Controller
{
    /**
     * tampilin semua event (READ)
     */
    public function index()
    {
        $events = Event::orderBy('date', 'desc')->get();
        return response()->json($events);
    }

    /**
     * simpan event baru (CREATE)
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'location' => 'required|string',
            'date' => 'required|date',
            'price' => 'required|integer|min:0',
            'quota' => 'required|integer|min:1',
        ]);

        $event = Event::create($validated);

        return response()->json($event, 201);
    }

    /**
     * tampilkan satu event spesifik (READ by ID)
     */
    public function show(Event $event)
    {
        return response()->json($event);
    }

    /**
     * update event yang sudah ada (UPDATE)
     */
    public function update(Request $request, Event $event)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'location' => 'required|string',
            'date' => 'required|date',
            'price' => 'required|integer|min:0',
            'quota' => 'required|integer|min:1',
        ]);

        $event->update($validated);

        return response()->json($event);
    }

    /**
     * Hapus event (DELETE)
     */
    public function destroy(Event $event)
    {
        $event->delete();
        return response()->json(null, 204);
    }
}
