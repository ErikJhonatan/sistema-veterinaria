<?php

namespace App\Models\Contabilidad;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CuentaContable extends Model
{
    use HasFactory;
    public function subCuentas()
    {
        return $this->hasMany(CuentaContable::class, 'cuenta_contable_id');
    }

    public function parent()
    {
        return $this->belongsTo(CuentaContable::class, 'cuenta_contable_id');
    }
}
