<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class StorageFileController extends Controller
{
    /**
     * fungsi ini akan mengambil path file dari URL,
     */
    public function show($path)
    {
        if (!Storage::disk('public')->exists($path)) {
            abort(404, 'File not found');
        }

        $fullPath = Storage::disk('public')->path($path);

        $mimeType = File::mimeType($fullPath);
        return response()->file($fullPath, ['Content-Type' => $mimeType]);
    }
}
