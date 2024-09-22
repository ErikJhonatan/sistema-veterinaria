<?php

namespace App\Http\Controllers\Contabilidad;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EquipoContableController extends Controller
{
    public function index() {
        return view('contabilidad.equipos');
    }
}
