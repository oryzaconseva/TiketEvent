<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EventPageController;
use App\Http\Controllers\Admin\BookingPageController;
use App\Http\Controllers\DashboardController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', [DashboardController::class, 'index'])
    ->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::resource('admin/events', EventPageController::class)->names('admin.events');
    Route::get('admin/bookings', [BookingPageController::class, 'index'])->name('admin.bookings.index');
    Route::post('admin/bookings/{id}/status', [BookingPageController::class, 'updateStatus'])->name('admin.bookings.updateStatus');
});



require __DIR__.'/auth.php';
