<?php

namespace App\Http\Controllers\TransaccionContable;

use Illuminate\Http\Request;
use App\Models\Contabilidad\LibroMayor;
use App\Models\Contabilidad\CuentaContable;
use Dompdf\Dompdf;
use App\Http\Controllers\Controller;


class ReporteContabilidadController extends Controller
{
    public function index() {
        return view('contabilidad.reportes');
    }

    public function estadoResultados(){
        // Definir fechas de inicio y fin del ejercicio
        $fecha_inicio = '2024-01-01';
        $fecha_fin = '2024-12-31';

        // Calcular sumas
        $cuentas_ingreso_venta = [$this->getIdCuenta(7011)];
        $suma_ingresos_venta = LibroMayor::whereIn('cuenta_contable_id', $cuentas_ingreso_venta)
                                         ->whereBetween('fecha', [$fecha_inicio, $fecha_fin])
                                         ->sum('debe');

        $cuentas_ingreso_servicio = [$this->getIdCuenta(7041)];
        $suma_ingresos_servicio = LibroMayor::whereIn('cuenta_contable_id', $cuentas_ingreso_servicio)
                                           ->whereBetween('fecha', [$fecha_inicio, $fecha_fin])
                                           ->sum('haber');

        $cuentas_gasto = [
            $this->getIdCuenta(621),
            $this->getIdCuenta(6411),
            $this->getIdCuenta(6361),
            $this->getIdCuenta(6363),
            $this->getIdCuenta(6365),
            $this->getIdCuenta(6364),
            $this->getIdCuenta(6351),
            $this->getIdCuenta(6356)
        ];

        $suma_gastos = LibroMayor::whereIn('cuenta_contable_id', $cuentas_gasto)
                                 ->whereBetween('fecha', [$fecha_inicio, $fecha_fin])
                                 ->sum('debe');

        // Calcular utilidad bruta y neta
        $utilidad_bruta = $suma_ingresos_venta + $suma_ingresos_servicio;
        $utilidad_neta = $utilidad_bruta - $suma_gastos;

        // Crear PDF
        $pdf = new Dompdf();
        $pdf->loadHtml('
            <h1>Estado de Resultados</h1>
            <p><strong>Periodo:</strong> '.$fecha_inicio.' - '.$fecha_fin.'</p>
            <table border="1" style="width: 100%; border-collapse: collapse;">
                <thead>
                    <tr>
                        <th style="padding: 8px; text-align: left;">Descripción</th>
                        <th style="padding: 8px; text-align: right;">Monto</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="padding: 8px;">Ingresos por venta</td>
                        <td style="padding: 8px; text-align: right;">'.number_format($suma_ingresos_venta, 2).'</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px;">Ingresos por servicio</td>
                        <td style="padding: 8px; text-align: right;">'.number_format($suma_ingresos_servicio, 2).'</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px;">Gastos</td>
                        <td style="padding: 8px; text-align: right;">'.number_format($suma_gastos, 2).'</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">Utilidad Bruta</td>
                        <td style="padding: 8px; text-align: right; font-weight: bold;">'.number_format($utilidad_bruta, 2).'</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">Utilidad Neta</td>
                        <td style="padding: 8px; text-align: right; font-weight: bold;">'.number_format($utilidad_neta, 2).'</td>
                    </tr>
                </tbody>
            </table>
        ');
        $pdf->setPaper('A4', 'landscape');
        $pdf->render();
        $pdf->stream('estado_resultados.pdf');
    }

    public function balanceGeneral()
    {
        $fecha_inicio = '2024-01-01';
        $fecha_fin = '2024-12-31';

        $caja = $this->getIdCuenta(101);
        $banco = $this->getIdCuenta(1061);

        $suma_caja = LibroMayor::where('cuenta_contable_id', $caja)
                               ->whereBetween('fecha', [$fecha_inicio, $fecha_fin])
                               ->sum('debe');
        $suma_banco = LibroMayor::where('cuenta_contable_id', $banco)
                                ->whereBetween('fecha', [$fecha_inicio, $fecha_fin])
                                ->sum('debe');

        $inventario = $this->getIdCuenta(7011);
        $suma_inventario = LibroMayor::where('cuenta_contable_id', $inventario)
                                    ->whereBetween('fecha', [$fecha_inicio, $fecha_fin])
                                    ->sum('debe');

        $capital = $this->getIdCuenta(501);
        $suma_capital = LibroMayor::where('cuenta_contable_id', $capital)
                                  ->whereBetween('fecha', [$fecha_inicio, $fecha_fin])
                                  ->sum('haber');

        $pdf = new Dompdf();

        // pdf con dos columnas ACTIVO y PASIVO | PATRIMONIO NETO
        // Al final de cada columna se muestra el total del activo y del pasivo + patrimonio neto
        $pdf->loadHtml('
            <h1>Balance General</h1>
            <p><strong>Periodo:</strong> '.$fecha_inicio.' - '.$fecha_fin.'</p>
            <table border="1" style="width: 100%; border-collapse: collapse;">
                <thead>
                    <tr>
                        <th style="padding: 8px; text-align: left;">ACTIVO</th>
                        <th style="padding: 8px; text-align: right;">Monto</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="padding: 8px;">Caja</td>
                        <td style="padding: 8px; text-align: right;">'.number_format($suma_caja, 2).'</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px;">Banco</td>
                        <td style="padding: 8px; text-align: right;">'.number_format($suma_banco, 2).'</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px;">Inventario</td>
                        <td style="padding: 8px; text-align: right;">'.number_format($suma_inventario, 2).'</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">Total Activo</td>
                        <td style="padding: 8px; text-align: right; font-weight: bold;">'.number_format($suma_caja + $suma_banco + $suma_inventario, 2).'</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <table border="1" style="width: 100%; border-collapse: collapse;">
                <thead>
                    <tr>
                        <th style="padding: 8px; text-align: left;">PASIVO | PATRIMONIO NETO</th>
                        <th style="padding: 8px; text-align: right;">Monto</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="padding: 8px;">Pasivo</td>
                        <td style="padding: 8px; text-align: right;"> 0.00</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px;">Capital</td>
                        <td style="padding: 8px; text-align: right;">'.number_format($suma_capital, 2).'</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">Total Pasivo | Patrimonio Neto</td>
                        <td style="padding: 8px; text-align: right; font-weight: bold;">'.number_format($suma_capital, 2).'</td>

                    </tr>
                </tbody>
            </table>
        ');
        $pdf->setPaper('A4', 'landscape');
        $pdf->render();
        $pdf->stream('balance_general.pdf');

    }

    public function getIdCuenta($codigo){
        $cuenta = CuentaContable::where('codigo', $codigo)->first();
        if(!$cuenta){
            dd('La cuenta contable con código '.$codigo.' no existe');
        }
        return $cuenta->id;
    }
}
