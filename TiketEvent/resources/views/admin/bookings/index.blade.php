<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Daftar Pemesan') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

            @if (session('success'))
                <div class="mb-4 p-4 bg-green-100 text-green-700 rounded-lg shadow">
                    {{ session('success') }}
                </div>
            @endif

            <div class="space-y-4">

                @forelse ($bookings as $booking)
                    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div class="p-4 sm:p-6 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">

                            <div class="flex items-center gap-4">
                                <img src="{{ $booking['event']['poster_image_url'] ?? 'https://via.placeholder.com/150.png?text=No+Image' }}" alt="{{ $booking['event']['name'] ?? 'Event' }}" class="w-16 h-16 sm:w-20 sm:h-20 object-cover rounded-md flex-shrink-0">

                                <div class="min-w-0"> <h3 class="text-lg font-semibold text-gray-900 truncate">{{ $booking['event']['name'] ?? 'Event Dihapus' }}</h3>
                                    <p class="text-sm text-gray-600">
                                        Pemesan: <span class="font-medium">{{ $booking['user']['name'] ?? 'User Dihapus' }}</span>
                                    </p>
                                    <p class="text-sm text-gray-500 mt-1">
                                        {{ $booking['quantity'] }} Tiket (Total: Rp {{ number_format($booking['total_price']) }})
                                    </p>
                                </div>
                            </div>

                            <div class="flex-shrink-0 w-full sm:w-auto flex justify-end">
                                @if ($booking['status'] == 'confirmed')
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                                        <svg class="-ml-1 mr-1.5 h-4 w-4 text-green-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                        Confirmed
                                    </span>
                                @else
                                    <form action="{{ route('admin.bookings.updateStatus', $booking['id']) }}" method="POST" class="inline">
                                        @csrf
                                        <input type="hidden" name="status" value="confirmed">
                                        <button type="submit" class="inline-flex items-center px-4 py-2 bg-primary-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-primary-700 active:bg-primary-700 focus:outline-none focus:border-primary-700 focus:ring ring-primary-300 disabled:opacity-25 transition ease-in-out duration-150 shadow-md">
                                            Approve
                                        </button>
                                    </form>
                                @endif
                            </div>

                        </div>
                    </div>
                @empty
                    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div class="p-6 text-center text-gray-500">
                            Belum ada pesanan yang masuk.
                        </div>
                    </div>
                @endforelse
            </div>
            </div>
    </div>
</x-app-layout>
