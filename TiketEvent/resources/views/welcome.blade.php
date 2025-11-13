<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>IZZITIX - Platform Booking Tiket Event No. 1</title>

    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="antialiased bg-gray-100">

    <div class="relative flex flex-col items-center justify-center min-h-screen py-10 px-4 sm:px-6 lg:px-8">

        <div class="max-w-md w-full bg-white p-8 sm:p-10 rounded-lg shadow-xl text-center">

            <div class="mb-8">
                <x-event-logo class="w-32 h-32 mx-auto fill-current text-primary-600 mb-4" />
                <h1 class="font-extrabold text-5xl text-gray-900 uppercase tracking-widest leading-none">
                    IZZITIX
                </h1>
                <p class="mt-3 text-lg text-gray-600 font-medium">
                    Platform Booking Tiket Event No. 1
                </p>
            </div>

            <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
                <a href="{{ route('login') }}" class="w-full sm:w-auto px-8 py-3 bg-primary-600 border border-transparent rounded-lg font-bold text-base text-white uppercase tracking-wider hover:bg-primary-700 active:bg-primary-700 focus:outline-none focus:border-primary-900 focus:ring ring-primary-300 disabled:opacity-25 transition ease-in-out duration-150 shadow-md">
                    Masuk (Login)
                </a>

                <a href="{{ route('register') }}" class="w-full sm:w-auto px-8 py-3 bg-white border border-gray-300 rounded-lg font-bold text-base text-gray-700 uppercase tracking-wider hover:bg-gray-50 active:bg-gray-100 focus:outline-none focus:border-primary-300 focus:ring ring-primary-300 disabled:opacity-25 transition ease-in-out duration-150 shadow-md">
                    Daftar Baru
                </a>
            </div>
        </div>

    </div>

</body>
</html>
