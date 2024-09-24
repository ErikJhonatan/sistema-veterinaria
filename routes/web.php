<?php

use App\Config\PermisosValue;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProveedorController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\ServicioController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\MascotaController;
use App\Http\Controllers\FormaPagoController;
use App\Http\Controllers\LineaController;
use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\SubCategoriaController;
use App\Http\Controllers\PresentacionController;
use App\Http\Controllers\UnidadMedidaController;
use App\Http\Controllers\EspecieController;
use App\Http\Controllers\RazaController;
use App\Http\Controllers\EventoController;
use App\Http\Controllers\TipoEventoController;
use App\Http\Controllers\EstadoEventoController;
use App\Http\Controllers\NotificacionController;
use App\Http\Controllers\TipoAlmacenController;
use App\Http\Controllers\VentasController;
use App\Http\Controllers\CajasController;
use App\Http\Controllers\ComprobantesController;
use App\Http\Controllers\AlmacenesController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\StocksController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CuadrarCajaController;
use App\Http\Controllers\TransaccionContable\AnioContableController;
use App\Http\Controllers\TransaccionContable\IngresoController;
use App\Http\Controllers\TransaccionContable\CompraController;
use App\Http\Controllers\TransaccionContable\GastoController;
use App\Http\Controllers\TransaccionContable\CapitalController;
use App\Http\Controllers\TransaccionContable\EquipoController;
use App\Http\Controllers\TransaccionContable\ReporteContabilidadController;
use App\Http\Services\PermisoService;
use Illuminate\Support\Facades\Auth;

 Route::redirect('/', '/dashboard', 301);

Route::get('/dashboard', function () {
    return view('dashboard', [
        "permisoService" => new PermisoService(),
        "permisosValue" => new PermisosValue(),
        "permisos" => PermisoService::permisosRol(Auth::user()->rol_id)
    ]);
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});
//########################


Route::middleware(['auth'])->group(function () {
    Route::resource('/proveedor', ProveedorController::class);

    Route::resource('/producto', ProductoController::class);
    Route::get('/producto/{id}/galeria', [ProductoController::class, 'galeria']);
    Route::get('/producto/{modulo}/auditoria', [ProductoController::class, 'auditoria']);

    Route::resource('/servicio', ServicioController::class);
    Route::get('/servicio/{modulo}/auditoria', [ServicioController::class, 'auditoria']);

    Route::resource('/cliente', ClienteController::class);
    Route::get('/cliente/{modulo}/auditoria', [ClienteController::class, 'auditoria']);

    Route::resource('/mascota', MascotaController::class)->middleware('auth');
    Route::get('/mascota/{modulo}/auditoria', [MascotaController::class, 'auditoria']);

    Route::get('/mascota/{id}/historial-clinico', [MascotaController::class, 'historialClinico']);
    Route::get('/mascota/{id}/galeria', [MascotaController::class, 'galeria']);
    Route::get('/mascota/{id}/historial-compra', [MascotaController::class, 'historialCompra']);


    //Route::resource('/evento', EventoController::class);
    Route::get('/evento', [EventoController::class, 'index'])->middleware(['auth', 'verified']);
    Route::get('/evento/list', [EventoController::class, 'list'])->middleware(['auth', 'verified']);
    Route::get('/evento/destroy/{id}', [EventoController::class, 'destroy'])->name('evento.destroy')->middleware(['auth', 'verified']);

    Route::resource('/formaPago', FormaPagoController::class);
    Route::resource('/linea', LineaController::class);
    Route::resource('/categoria', CategoriaController::class);
    Route::resource('/subCategoria', SubCategoriaController::class);
    Route::resource('/presentacion', PresentacionController::class);
    Route::resource('/unidadMedida', UnidadMedidaController::class);
    Route::resource('/especie', EspecieController::class);
    Route::resource('/raza', RazaController::class);
    Route::resource('/tipoEvento', TipoEventoController::class);
    Route::resource('/estadoEvento', EstadoEventoController::class);
    Route::resource('/notificacion', NotificacionController::class);
    Route::resource('/tipoAlmacen', TipoAlmacenController::class);
    Route::resource('/ventas', VentasController::class);
    Route::resource('/cajas', CajasController::class);
    Route::get('/cuadrar-caja/pdf', [CuadrarCajaController::class, 'pdfCaja'])->name('cuadrarCajaPdf.pdf');
    Route::resource('/cuadrar-caja', CuadrarCajaController::class);
    
    Route::resource('/comprobantes', ComprobantesController::class);
    Route::resource('/almacenes', AlmacenesController::class);
    Route::resource('/stocks', StocksController::class);

    Route::get('/usuarios', [UserController::class, 'index']);
    Route::get('/roles', [RolController::class, 'index']);

    Route::get('/graficos-ventas', [VentasController::class, 'graficos']);

    Route::get('/comprobantes/generar-pdf/{comprobante_id}', [ComprobantesController::class, 'pdf'])->name('comprobantes.pdf')->middleware('auth', 'verified');
    Route::get('/comprobantes/{comprobante_id}/pdf', [ComprobantesController::class, 'pdf'])->name('comprobantes.pdf');
    Route::post('/comprobantes/agregar-pago', [ComprobantesController::class, 'ajax'])->name('comprobantes.ajax')->middleware('auth', 'verified');
    Route::post('/stocks/agregar-stock', [StocksController::class, 'ajax'])->name('stocks.ajax')->middleware('auth', 'verified');

    Route::get('/getProvincias/{Depto}',[ClienteController::class,'getProvincias'])->middleware(['auth', 'verified']);
    Route::get('/getDistritos/{Prov}',[ClienteController::class,'getDistritos'])->middleware(['auth', 'verified']);
    Route::get('/getCategorias/{Linea}',[ServicioController::class,'getCategorias'])->middleware(['auth', 'verified']);
    Route::get('/getSubCategorias/{Categ}',[ServicioController::class,'getSubCategorias'])->middleware(['auth', 'verified']);
    Route::get('/getRazas/{Especie}',[MascotaController::class,'getRazas'])->middleware(['auth', 'verified']);
    Route::get('/getMascotas/{Cliente}',[MascotaController::class,'getMascotas'])->middleware(['auth', 'verified']);
    Route::get('/clienteGraf',[ClienteController::class,'getGrafico'])->middleware(['auth', 'verified']);
    Route::get('/mascotaGraf',[MascotaController::class,'getGrafico'])->middleware(['auth', 'verified']);

    Route::resource('/ingresos', IngresoController::class);
    Route::resource('/compras', CompraController::class);
    Route::resource('/gastos', GastoController::class);
    Route::resource('/capital', CapitalController::class);
    Route::resource('/equipos', EquipoController::class);
    Route::get('/reportes', [ReporteContabilidadController::class, 'index']);
    Route::get('/anio-contable', [AnioContableController::class, 'index']);
});

require __DIR__.'/auth.php';


Auth::routes();


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::redirect('/home', '/dashboard');
