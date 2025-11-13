<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use App\Models\Event;

class EventPageController extends Controller
{
    protected $apiUrl = 'http://127.0.0.1:8001/api/events';

    /**
     * tampilkan halaman utama (READ)
     */
    public function index()
    {
        $response = Http::get($this->apiUrl);
        $events = $response->json();
        return view('admin.events.index', ['events' => $events]);
    }

    /**
     * tampilkan form untuk menambah event baru (CREATE form)
     */
    public function create()
    {
        return view('admin.events.create');
    }

    /**
     * simpan data dari form (CREATE process)
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
            'poster_image' => 'required|image|file|max:2048',
        ]);

        $path = $request->file('poster_image')->store('posters', 'public');
        $validated['poster_image'] = $path;

        Event::create($validated);

        return redirect()->route('admin.events.index')->with('success', 'Event baru berhasil ditambahkan!');
    }

    /**
     * tampilkan form untuk mengedit event (EDIT form)
     */
    public function edit($id)
    {
        $response = Http::get('http://127.0.0.1:8001/api/events/' . $id);
        $event = $response->json();

        return view('admin.events.edit', ['event' => $event]);
    }

    /**
     * Update data dari form-edit (UPDATE process)
     */
    public function update(Request $request, $id)
    {
        $event = Event::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'location' => 'required|string',
            'date' => 'required|date',
            'price' => 'required|integer|min:0',
            'quota' => 'required|integer|min:1',
            'poster_image' => 'nullable|image|file|max:2048',
        ]);

        if ($request->hasFile('poster_image')) {

            if ($event->poster_image) {
                Storage::disk('public')->delete($event->poster_image);
            }

            $path = $request->file('poster_image')->store('posters', 'public');
            $validated['poster_image'] = $path;
        }

        $event->update($validated);

        return redirect()->route('admin.events.index')->with('success', 'Event berhasil diperbarui!');
    }

    public function destroy($id)
    {
        $event = Event::findOrFail($id);

        if ($event->poster_image) {
            Storage::disk('public')->delete($event->poster_image);
        }

        $event->delete();
        return redirect()->route('admin.events.index')->with('success', 'Event berhasil dihapus!');
    }

    public function show($id)
    {

    }
}
