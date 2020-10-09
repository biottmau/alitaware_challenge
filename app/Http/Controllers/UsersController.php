<?php

namespace App\Http\Controllers;

use App\Models\Services;
use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{

    /**
     * Controlador de la busqueda de suscriptores o usuarios
     */
    public function search($value){
        return User::search($value);
    }


}