<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Edit Event: ') . $event['name'] }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">

                    <form action="{{ route('admin.events.update', $event['id']) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')

                        <div class="mb-4">
                            <label for="name" class="block text-sm font-medium text-gray-700">Nama Event</label>
                            <input type="text" name="name" id="name" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500" value="{{ old('name', $event['name']) }}" required>
                        </div>

                        <div class="mb-4">
                            <label for="description" class="block text-sm font-medium text-gray-700">Deskripsi</label>
                            <textarea name="description" id="description" rows="4" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500" required>{{ old('description', $event['description']) }}</textarea>
                        </div>

                        <div class="mb-4">
                            <label for="location" class="block text-sm font-medium text-gray-700">Lokasi</label>
                            <input type="text" name="location" id="location" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500" value="{{ old('location', $event['location']) }}" required>
                        </div>

                        <div class="mb-4">
                            <label for="date" class="block text-sm font-medium text-gray-700">Tanggal & Waktu</label>
                            <input type="datetime-local" name="date" id="date" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500" value="{{ old('date', \Carbon\Carbon::parse($event['date'])->format('Y-m-d\TH:i')) }}" required>
                        </div>

                        <div class="mb-4">
                            <label for="price" class="block text-sm font-medium text-gray-700">Harga (Rp)</label>
                            <input type="number" name="price" id="price" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500" value="{{ old('price', $event['price']) }}" required>
                        </div>

                        <div class="mb-4">
                            <label for="quota" class="block text-sm font-medium text-gray-700">Kuota</label>
                            <input type="number" name="quota" id="quota" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500" value="{{ old('quota', $event['quota']) }}" required>
                        </div>

                        <div class="mb-4">
                            <label for="poster_image" class="block text-sm font-medium text-gray-700">Poster Event (Gambar)</label>
                            <input type="file" name="poster_image" id="poster_image" class="mt-1 block w-full">
                            <span class="text-xs text-gray-500">Kosongkan jika tidak ingin mengubah gambar.</span>

                            @if ($event['poster_image_url'])
                                <div class="mt-2">
                                    <img src="{{ $event['poster_image_url'] }}" alt="Poster Saat Ini" class="w-32 h-32 object-cover rounded">
                                </div>
                            @endif
                        </div>

                        <div>
                            <button type="submit" class="inline-flex items-center px-4 py-2 bg-primary-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-primary-700 active:bg-primary-700 focus:outline-none focus:border-primary-700 focus:ring ring-primary-300 disabled:opacity-25 transition ease-in-out duration-150">
                                Update Event
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
