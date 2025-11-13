<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Manajemen Event') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

            <div class="mb-6">
                <a href="{{ route('admin.events.create') }}" class="inline-flex items-center px-4 py-2 bg-primary-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-primary-700 active:bg-primary-700 focus:outline-none focus:border-primary-700 focus:ring ring-primary-300 disabled:opacity-25 transition ease-in-out duration-150 shadow-md">
                    Tambah Event Baru
                </a>
            </div>

            @if (session('success'))
                <div class="mb-4 p-4 bg-green-100 text-green-700 rounded-lg shadow">
                    {{ session('success') }}
                </div>
            @endif

            <div class="space-y-4">

                @forelse ($events as $event)
                    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div class="p-4 sm:p-6 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">

                            <div class="flex items-center gap-4">
                                <img src="{{ $event['poster_image_url'] }}" alt="{{ $event['name'] }}" class="w-16 h-16 sm:w-20 sm:h-20 object-cover rounded-md flex-shrink-0">
                                <div class.="min-w-0"> <h3 class="text-lg font-semibold text-gray-900 truncate">{{ $event['name'] }}</h3>
                                    <p class="text-sm text-gray-600">{{ $event['location'] }}</p>
                                    <p class="text-sm text-gray-500 mt-1">
                                        {{ \Carbon\Carbon::parse($event['date'])->format('d M Y, H:i') }}
                                    </p>
                                </div>
                            </div>

                            <div class="flex flex-row sm:flex-col items-center justify-between sm:items-end gap-2 w-full sm:w-auto">
                                <div class="text-lg font-bold text-primary-600">
                                    Rp {{ number_format($event['price']) }}
                                </div>
                                <div class="flex-shrink-0 flex gap-4 mt-0 sm:mt-2">
                                    <a href="{{ route('admin.events.edit', $event['id']) }}" class="text-primary-600 hover:text-primary-700 font-medium">Edit</a>

                                    <form action="{{ route('admin.events.destroy', $event['id']) }}" method="POST" class="inline" onsubmit="return confirm('Yakin ingin menghapus event ini?');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="text-theme-red hover:text-theme-red-dark font-medium">Hapus</button>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                @empty
                    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div class="p-6 text-center text-gray-500">
                            Kamu belum membuat event apapun. Klik "Tambah Event Baru" untuk memulai!
                        </div>
                    </div>
                @endforelse
            </div>
            </div>
    </div>
</x-app-layout>
