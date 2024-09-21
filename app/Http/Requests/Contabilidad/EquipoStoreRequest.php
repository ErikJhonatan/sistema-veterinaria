<?php

namespace App\Http\Requests\Contabilidad;

use Illuminate\Foundation\Http\FormRequest;

class EquipoStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'anio' => 'required|integer|min:2024',
            'nombre' => 'required|string',
            'marca' => 'required|string',
            'modelo' => 'required|string',
            'serie' => 'required|string',
            'metodo_pago' => 'required|string|in:efectivo,transferencia',
            'fecha_adquisicion' => 'required|date|before_or_equal:now',
            'costo' => 'required|numeric|min:0.01',
            'vida_util' => 'required|integer|min:1',
            'estado' => 'required|string|in:nuevo,usado',
            'descripcion' => 'required|string'
        ];
    }
}
