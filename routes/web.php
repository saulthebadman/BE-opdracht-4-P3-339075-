<?php
use App\Http\Controllers\AllergenenController;
use App\Http\Controllers\LeverancierController;

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/



Route::get('/', [AllergenenController::class, 'index'])->name('home');
Route::post('/filter', [AllergenenController::class, 'filter'])->name('allergenen.filter');
Route::get('/leverancier/{id}', [LeverancierController::class, 'show'])->name('leverancier.info');
Route::get('/filter-allergenen', [AllergenenController::class, 'filter'])->name('filter.allergenen');


/////////////////////////////////////////////////////////////////////////////////////////////////////