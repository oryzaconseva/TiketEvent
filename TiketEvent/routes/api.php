<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\EventController;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\StorageFileController;
use App\Http\Controllers\Api\DashboardStatsController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// --- ruteauth publik ---
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// --- ruteevent publik ---
Route::apiResource('events', EventController::class);

// --- ruteadmin publik ---
Route::get('/bookings', [BookingController::class, 'index']);
Route::patch('/bookings/{booking}/status', [BookingController::class, 'updateStatus']);

Route::get('/admin/stats', [DashboardStatsController::class, 'index']);

// --- rute proxy gambar publik ---
Route::get('/storage/{path}', [StorageFileController::class, 'show'])->where('path', '.*');


// --- rute yang harus login dilindungi token/sanctum ---
Route::middleware('auth:sanctum')->group(function () {

    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/bookings', [BookingController::class, 'store']);
    Route::get('/my-bookings', [BookingController::class, 'getMyBookings']);
});
