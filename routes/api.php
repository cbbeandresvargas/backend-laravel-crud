<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\api\studentController;


Route::get('/test', [studentController::class, 'index']);

Route::get('/test/{id}', [studentController::class, 'show']);

Route::post('/test', [studentController::class, 'store']);

Route::put('/test/{id}', [studentController::class, 'update']);

Route::patch('/test/{id}', [studentController::class, 'updatePartial']);

Route::delete('/test/{id}', [studentController::class, 'destroy']);