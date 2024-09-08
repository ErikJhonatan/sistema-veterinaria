<?php

namespace App\Models\Contabilidad;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaccionContable extends Model
{
    use HasFactory;

    protected $fillable = [
        'fecha',
        'tipo_transaccion',
        'cuenta_debito_id',
        'cuenta_credito_id',
        'monto',
        'descripcion',
    ];
}
