<?php
namespace App\Http\Services\TransaccionContable;

use App\Models\Contabilidad\LibroDiario;
use App\Models\Contabilidad\LibroMayor;
use App\Http\Services\Contabilidad\LibroDiario\LibroDiarioService;
use App\Http\Services\Contabilidad\LibroMayor\LibroMayorService;
use App\Models\Contabilidad\TransaccionContable;
use App\Models\Contabilidad\CuentaContable;
use App\Models\Contabilidad\EquipoContable;
use Carbon\Carbon;
class EquipoService
{
    protected $transaccionContableService;
    protected $libroDiarioService;
    protected $libroMayorService;

    public function __construct(
        TransaccionContableService $transaccionContableService,
        LibroDiarioService $libroDiarioService,
        LibroMayorService $libroMayorService
    )

    {
        $this->transaccionContableService = $transaccionContableService;
        $this->libroDiarioService = $libroDiarioService;
        $this->libroMayorService = $libroMayorService;
    }

    public function registrarEquipo($dataValidated)
    {

        $transaccionEquipo = $this->transaccionContableService->crearTransaccionContable(
            [
                'concepto' => 'Compra de equipo ' . $dataValidated['nombre'],
                'monto' => $dataValidated['costo'],
                'fecha' => $dataValidated['fecha_adquisicion'],
                'tipo_transaccion' => 'compra_equipo',
                'monto_total' => $dataValidated['precio'],
                'cuenta_debito_id' => $this->transaccionContableService->buscarCuentaPorCodigo(
                    CuentaContable::MAQUINARIAS_EQUIPOS_ADQ
                )->id,
                'cuenta_credito_id' => $this->transaccionContableService->buscarCuentaPorCodigo(
                    $dataValidated['metodo_pago'] === 'efectivo' ? CuentaContable::CAJA : CuentaContable::BANCOS
                )->id
            ]
        );

        $transaccionDepreciacion = $this->transaccionContableService->crearTransaccionContable([
            'concepto' => 'Depreciacion de equipo ' . $dataValidated['nombre'],
            'monto' => $dataValidated['precio'] / $dataValidated['vida_util'],
            'fecha' => $dataValidated['fecha'],
            'tipo_transaccion' => 'depreciacion_equipo',
            'monto_total' => $dataValidated['precio'],
            'cuenta_debito_id' =>  $this->transaccionContableService->buscarCuentaPorCodigo(
                CuentaContable::DEPRECIACION_MAQUINARIAS_EQUIPOS
            )->id,
            'cuenta_credito_id' => $this->transaccionContableService->buscarCuentaPorCodigo(
                CuentaContable::REEVALUACION_MAQUINARIAS_EQUIPOS
            )->id,
        ]);
        $dataValidated['transaccion_contable_id'] = $transaccionEquipo->id;
        $dataValidated['transaccion_depreciacion_id'] = $transaccionDepreciacion->id;


        $equipo = EquipoContable::create($dataValidated);


        for($i = 0; $i < $dataValidated['vida_util']; $i++){
            $fecha = Carbon::parse($dataValidated['fecha']);
            $dataDepreciacion = [
                'fecha' => $fecha->addYear($i),
                'monto' => $transaccionDepreciacion->monto,
                'concepto' => $transaccionDepreciacion->concepto,
                'cuenta_debito_id' => $transaccionDepreciacion->cuenta_debito_id,
                'cuenta_credito_id' => $transaccionDepreciacion->cuenta_credito_id
            ];
           $$this->registrarDepreciacionEquipo($dataDepreciacion, $transaccionDepreciacion, $dataValidated['vida_util']);
        }
        return $equipo;
    }


    public function registrarDepreciacionEquipo($data, $transaccionContable, $vidaUtil)
    {
        for($i = 0; $i < $vidaUtil; $i++){

        // libro diario
        $registroCuentaDebitoLibroDiario = $this->libroDiarioService->registrarLibroDiario(
            $data['fecha'],
            $data['monto'],
            0,
            $data['concepto'],
            $data['cuenta_debito_id'],
            $transaccionContable->id
        );

        $registroCuentaCreditoLibroDiario = $this->libroDiarioService->registrarLibroDiario(
            $data['fecha'],
            0,
            $data['monto'],
            $data['concepto'],
            $data['cuenta_credito_id'],
            $transaccionContable->id
        );

        // libro mayor
        $registroCuentaDebitoLibroMayor = $this->libroMayorService->registrarLibroMayor(
            $data['fecha'],
            $data['monto'],
            0,
            $data['monto'],
            0,
            $data['cuenta_debito_id'],
            $transaccionContable->id,
            $registroCuentaDebitoLibroDiario->id
        );

        $registroCuentaCreditoLibroMayor = $this->libroMayorService->registrarLibroMayor(
            $data['fecha'],
            0,
            $data['monto'],
            0,
            $data['monto'],
            $data['cuenta_credito_id'],
            $transaccionContable->id,
            $registroCuentaCreditoLibroDiario->id
        );
        }
    }

    public function buscarEquipo($id)
    {
        return EquipoContable::find($id);
    }

    public function actualizarEquipo($equipo, $transaccion, $data)
    {
        $equipo->update($data);

        $depreciaciones_libro_diario = LibroDiario::where('tipo_transaccion', 'depreciacion_equipo')
            ->where('transaccion_id', $equipo->transaccion_contable_id)
            ->get();
        $depreciaciones_libro_mayor = LibroMayor::where('tipo_transaccion', 'depreciacion_equipo')
            ->where('transaccion_id', $equipo->transaccion_contable_id)
            ->get();

        foreach($depreciaciones_libro_diario as $depreciacion){
            // actualizar libro diario cuenta debito
            if($depreciacion->cuenta_id === $transaccion->cuenta_debito_id){
                $depreciacion->update([
                    'fecha' => $data['fecha_compra'],
                    'debe' => $equipo->precio / $equipo->vida_util,
                    'concepto' => 'Depreciacion de equipo ' . $equipo->nombre
                ]);
            }
            // actualizar libro diario cuenta credito
            else if($depreciacion->cuenta_id === $transaccion->cuenta_credito_id){
                $depreciacion->update([
                    'fecha' => $data['fecha_compra'],
                    'haber' => $equipo->precio / $equipo->vida_util,
                    'concepto' => 'Depreciacion de equipo ' . $equipo->nombre
                ]);
            }
        }

        foreach($depreciaciones_libro_mayor as $depreciacion){
            // actualizar libro mayor cuenta debito
            if($depreciacion->cuenta_id === $transaccion->cuenta_debito_id){
                $depreciacion->update([
                    'fecha' => $data['fecha_compra'],
                    'debe' => $equipo->precio / $equipo->vida_util,
                    'saldo_deudor' => $equipo->precio / $equipo->vida_util
                ]);
            }
            // actualizar libro mayor cuenta credito
            else if($depreciacion->cuenta_id === $transaccion->cuenta_credito_id){
                $depreciacion->update([
                    'fecha' => $data['fecha_compra'],
                    'haber' => $equipo->precio / $equipo->vida_util,
                    'saldo_acreedor' => $equipo->precio / $equipo->vida_util
                ]);
            };
        }
        return $equipo;
    }


    public function listarEquipos($year)
    {
        return EquipoContable::whereYear('fecha_compra', $year)->get();
    }

    public function eliminarEquipo($idTransaccion)
    {
        $transaccion = TransaccionContable::find($idTransaccion);

        if (!$transaccion) {
            return response(['message' => 'Transaccion no encontrada'], 404);
        }
        $transaccion->delete();
        return response(['message' => 'Transaccion eliminada'], 200);
    }
}
