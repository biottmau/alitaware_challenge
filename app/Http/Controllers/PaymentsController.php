<?php
namespace App\Http\Controllers;

use App\Models\Payments;
use App\Models\Services;
use App\Models\User;
use Illuminate\Http\Request;

class PaymentsController extends Controller
{

    /**
     * Controlador de la busqueda de suscriptores o usuarios
     */
    public function index(){

        return view("payments.index");
    }


    /**
     * Devuelve array con los payments realizados
     */
    public function getPayments(){
        $m = Payments::getAllForDataTable();
        return $m;
    }

}