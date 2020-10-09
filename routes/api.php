<?php

use App\Http\Controllers\PaymentsController;
use App\Http\Controllers\UsersController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Endpoint de busqueda de suscriptores/usuarios
Route::get('users/search/{val}', [UsersController::class, 'search']);

// Endpoint que devuelve la provincia utilizando la API del ejercicio
Route::get('provncia/{lat}/{lon}', function ($lat, $lon) {
    // Utilizo el Objeto Http para consumir 3rd API 
    $response = Http::get("https://apis.datos.gob.ar/georef/api/ubicacion", [
        'lat' => $lat,
        'lon' => $lon
    ]);
    $resp = $response->json();
    // Si devuelve error, envio mensaje
    if (isset($resp['errores']))
        return [
            'status' => false,
            'error' => "Se produjo un error en la API "
        ];
    // Devuelvo solo la ubicacion 
    return [
        'status' => true,
        'error' => "",
        'ubicacion' => $resp['ubicacion']
    ];
});


// Endpoint de busqueda de pagos
Route::get('payments', [PaymentsController::class, 'getPayments']);
