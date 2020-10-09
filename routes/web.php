<?php

use App\Http\Controllers\PaymentsController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


// Agrego ruteo para el formulario de busqueda de usuarios
Route::get('/user/search', function () {
    return view('users.search');
});

// Agrego ruteo para el formulario de muestreo de pagos
Route::get('/payments', [PaymentsController::class,'index']);
