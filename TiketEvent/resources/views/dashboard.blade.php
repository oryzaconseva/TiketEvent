<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

                <div class="bg-gradient-to-br from-primary-500 to-teal-600 text-white shadow-lg rounded-lg p-6 flex items-center justify-between">
                    <div>
                        <h3 class="text-sm font-medium text-primary-100 uppercase tracking-wider">Total Event</h3>
                        <p class="text-4xl font-bold">{{ $stats['total_events'] ?? 'N/A' }}</p>
                    </div>
                    <svg class="w-12 h-12 text-primary-300 opacity-70" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 0 1 0 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 0 1 0-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375Z" />
                    </svg>
                </div>

                <div class="bg-gradient-to-br from-blue-500 to-indigo-600 text-white shadow-lg rounded-lg p-6 flex items-center justify-between">
                    <div>
                        <h3 class="text-sm font-medium text-blue-100 uppercase tracking-wider">Total Pesanan</h3>
                        <p class="text-4xl font-bold">{{ $stats['total_bookings'] ?? 'N/A' }}</p>
                    </div>
                    <svg class="w-12 h-12 text-blue-300 opacity-70" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 0 0 3.741-.479 3 3 0 0 0-4.682-2.72m-4.682-2.72-4.682 2.72a3 3 0 0 1-4.682-2.72 9.094 9.094 0 0 1 3.741-.479M18 18.72A7.96 7.96 0 0 0 21.741 12 7.96 7.96 0 0 0 18 5.28a7.96 7.96 0 0 0-3.741 6.72M18 18.72m-4.682-2.72A7.96 7.96 0 0 1 12 5.28a7.96 7.96 0 0 1 3.741 6.72m0 0a7.96 7.96 0 0 1-3.741 6.72M12 12a2.25 2.25 0 1 0 0-4.5 2.25 2.25 0 0 0 0 4.5ZM12 12a2.25 2.25 0 1 1 0 4.5 2.25 2.25 0 0 1 0-4.5Z" />
                    </svg>
                </div>

                <div class="bg-gradient-to-br from-yellow-500 to-orange-600 text-white shadow-lg rounded-lg p-6 flex items-center justify-between">
                    <div>
                        <h3 class="text-sm font-medium text-yellow-100 uppercase tracking-wider">Pesanan Pending</h3>
                        <p class="text-4xl font-bold">{{ $stats['pending_bookings'] ?? 'N/A' }}</p>
                    </div>
                    <svg class="w-12 h-12 text-yellow-300 opacity-70" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6h4.5m4.5 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                    </svg>
                </div>

            </div>
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <h3 class="text-lg font-semibold leading-6 text-gray-900 mb-4">
                        5 Pesanan Terbaru
                    </h3>

                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Pemesan</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Event</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @forelse ($recentBookings as $booking)
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ $booking['id'] }}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $booking['user']['name'] ?? 'N/A' }}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $booking['event']['name'] ?? 'N/A' }}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        @if ($booking['status'] == 'confirmed')
                                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                                Confirmed
                                            </span>
                                        @else
                                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                                Pending
                                            </span>
                                        @endif
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center">Belum ada pesanan yang masuk.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</x-app-layout>
