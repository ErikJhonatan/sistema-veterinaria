<?php

namespace App\Models\Contabilidad;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EquipoContable extends Model
{
    use HasFactory;

    protected $fillable = [
        'transaccion_id',
        'nombre',
        'descripcion',
        'marca',
        'modelo',
        'serie',
        'placa',
        'anio',
        'color',
        'estado',
        'tipo',
        'vida_util',
    ];
    public function transaccion()
    {
        return $this->belongsTo(TransaccionContable::class);
    }
}
