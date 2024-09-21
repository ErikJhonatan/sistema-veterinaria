<?php

namespace App\Http\Requests\Contabilidad;

use Illuminate\Foundation\Http\FormRequest;

class EquipoUpdateRequest extends FormRequest
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
            'nombre' => 'string',
            'marca' => 'string',
            'modelo' => 'string',
            'serie' => 'string',
            'fecha_adquisicion' => 'date|before_or_equal:now',
            'costo' => 'numeric|min:0.01',
            'estado' => 'string|in:nuevo,usado',
            'descripcion' => 'string'
        ];
    }
}
