@extends('adminlte::page')

@section('title', 'Consultorio veterinario SOS | Equipos')

@php
  $heads = ['Fecha Registro', 'ID', 'Tipo', 'Método de Pago', 'Concepto', 'Monto', 'Acciones'];
  $config = [
      'language' => [
          'url' => '//cdn.datatables.net/plug-ins/2.0.1/i18n/es-ES.json',
      ],
      'order' => [],
  ];

@endphp

@section('content_header')
  <h1 class="m-0 text-dark"><i class="fas fa-fw fa-tools"></i> Equipos</h1>
@stop

@section('content')
  <div class="card card-primary">
    <div class="card-header">
      <h3 class="card-title">Listado de Equipos</h3>
    </div>
    <div class="card-body">
      @if (session('msg'))
        <div class="row">
          <div class="col-md-8"></div>
          <div class="col-md-4">
            <x-adminlte-alert theme="success" id='success-alert' title="" dismissable>
              {{ session('msg') }}
            </x-adminlte-alert>
          </div>
        </div>
      @endif

      @if (session('error'))
        <div class="row">
          <div class="col-md-8"></div>
          <div class="col-md-4">
            <x-adminlte-alert theme="danger" id='error-alert' title="" dismissable>
              {{ session('error') }}
            </x-adminlte-alert>
          </div>
        </div>
      @endif

      <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
        <div class="btn-group mr-2" role="group" aria-label="Third group">
          <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#ModalNew"
            title="Nuevo Equipo">Registrar Equipo</button>
        </div>
      </div>

      <hr>

      {{-- <div class="row">
        <x-adminlte-datatable id="example" :heads="$heads" head-theme="light" striped hoverable bordered compressed
          beautify with-buttons :config="$config">
          @foreach ($transacciones as $trans)
            @php

              $ingreso_referencia = str_pad($trans->id, 8, '0', STR_PAD_LEFT);

            @endphp

            <tr>
              <td>{{ \Carbon\Carbon::parse($trans->created_at)->format('Y-m-d H:i:s') }}</td>
              <td>
                Ingreso #{{ $ingreso_referencia }}
              </td>
              <td>
                {{ $trans->tipo_transaccion }}
              </td>
              <td>
                {{ $trans->metodo_pago }}
              </td>
              <td>
                {{ $trans->descripcion }}
              </td>
              <td>
                {{ Prices::symbol() }} {{ number_format($trans->monto, 2, ',', '') }}
              </td>
              <td>
                <button type="button" class="btn btn-xs btn-default text-primary mx-1 shadow" data-toggle="modal"
                  data-target="#ModalEdit" title="Editar Categoria"
                  onclick="obtenerInfoEdi('{{ $trans->id }}', '{{ $trans->fecha }}', '{{ $trans->descripcion }}', '{{ $trans->monto }}')"><i
                    class="fa fa-lg fa-fw fa-pen"></i></button>
                <form action="{{ route('ingresos.destroy', $trans->id) }}" method="post" class="form">
                  <button type="submit" class="eliminar-ingreso delete btn btn-xs btn-default text-danger mx-1 shadow"
                    title="Eliminar ingreso #{{ $ingreso_referencia }}" data-referencia="{{ $ingreso_referencia }}">
                    <i class="fa fa-lg fa-fw fa-trash"></i>
                  </button>

                  @method('DELETE')
                  @csrf
                </form>
              </td>
            </tr>
          @endforeach
        </x-adminlte-datatable>
      </div> --}}

      <!-- Modal Create -->
      <div class="modal fade " id="ModalNew" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header bg-warning">
              <h5 class="modal-title" id="exampleModalCenterTitle">Registrar Nuevo Equipo</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="{{ url('productos') }}" method="post">
              @csrf
              <div class="modal-body">
                <div class="row">
                  {{-- Nombre --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="nombre">Nombre</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-tag"></i></span>
                        </div>
                        <input type="text" class="form-control form-control-sm" id="nombre" name="nombre"
                          value="{{ old('nombre') }}" placeholder="* Nombre" required>
                      </div>
                    </div>
                  </div>

                  {{-- Descripción --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="descripcion">Descripción</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-info-circle"></i></span>
                        </div>
                        <input type="text" class="form-control form-control-sm" id="descripcion" name="descripcion"
                          value="{{ old('descripcion') }}" placeholder="* Descripción" required>
                      </div>
                    </div>
                  </div>

                  {{-- Marca --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="marca">Marca</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-industry"></i></span>
                        </div>
                        <input type="text" class="form-control form-control-sm" id="marca" name="marca"
                          value="{{ old('marca') }}" placeholder="* Marca" required>
                      </div>
                    </div>
                  </div>

                  {{-- Modelo --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="modelo">Modelo</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-cogs"></i></span>
                        </div>
                        <input type="text" class="form-control form-control-sm" id="modelo" name="modelo"
                          value="{{ old('modelo') }}" placeholder="* Modelo" required>
                      </div>
                    </div>
                  </div>

                  {{-- Serie --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="serie">Serie</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-barcode"></i></span>
                        </div>
                        <input type="text" class="form-control form-control-sm" id="serie" name="serie"
                          value="{{ old('serie') }}" placeholder="* Serie" required>
                      </div>
                    </div>
                  </div>

                  {{-- Año de Fabricación --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="anio_fabricacion">Año de Fabricación</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-calendar"></i></span>
                        </div>
                        <input type="number" class="form-control form-control-sm" id="anio_fabricacion"
                          name="anio_fabricacion" value="{{ old('anio_fabricacion') }}"
                          placeholder="* Año de Fabricación" min="1000" max="9999" required>
                      </div>
                    </div>
                  </div>

                  {{-- Precio --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="precio">Precio</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-dollar-sign"></i></span>
                        </div>
                        <input type="number" class="form-control form-control-sm" id="precio" name="precio"
                          value="{{ old('precio') }}" placeholder="* Precio" min="0" step="0.01" required>
                      </div>
                    </div>
                  </div>

                  {{-- Método de Pago --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="metodo_pago">Método de Pago</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-credit-card"></i></span>
                        </div>
                        <select class="form-control form-control-sm" id="metodo_pago" name="metodo_pago" required>
                          <option value="" disabled selected>* Método de Pago...</option>
                          <option value="efectivo">Efectivo</option>
                          <option value="tarjeta">Tarjeta</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  {{-- Color --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="color">Color</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-palette"></i></span>
                        </div>
                        <input type="text" class="form-control form-control-sm" id="color" name="color"
                          value="{{ old('color') }}" placeholder="* Color" required>
                      </div>
                    </div>
                  </div>

                  {{-- Estado --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="estado">Estado</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-info-circle"></i></span>
                        </div>
                        <select class="form-control form-control-sm" id="estado" name="estado" required>
                          <option value="" disabled selected>* Estado...</option>
                          <option value="nuevo">Nuevo</option>
                          <option value="usado">Usado</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  {{-- Vida Útil --}}
                  <div class="col-md-6">
                    <div class="form-group">
                      <label class="form-label" for="vida_util">Vida Útil</label>
                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-fw fa-hourglass-half"></i></span>
                        </div>
                        <input type="number" class="form-control form-control-sm" id="vida_util" name="vida_util"
                          value="{{ old('vida_util') }}" placeholder="* Vida Útil (años)" min="0" required>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <!-- Modal Edit -->
      <div class="modal fade " id="ModalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header bg-warning">
              <h5 class="modal-title" id="exampleModalCenterTitle">Modificar Ingreso</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="{{ url('ingresos/1') }}" method="post">
              @method('PUT')
              @csrf
              <div class="modal-body">
                {{-- ID --}}
                <div class="form-group">
                  <label class="form-label" for="idIngreso">ID</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-calendar-alt"></i>
                    </div>
                    <input type="text" class="form-control form-control-sm" id="idIngreso" name="idIngreso"
                      value="" placeholder="idIngreso" readonly>
                  </div>
                </div>

                {{-- Fecha --}}
                <div class="form-group">
                  <label class="form-label" for="fecha">Fecha</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-calendar-alt"></i>
                    </div>
                    <input id="fecha" type="datetime-local" class="form-control form-control-sm" id="fecha"
                      name="fecha" required value="{{ now()->format('Y-m-d\TH:i') }}">
                  </div>
                </div>

                {{-- Año (Campo Escondido) --}}
                <input type="hidden" id="anioEdit" name="anio">

                {{-- Monto --}}
                <div class="form-group">
                  <label class="form-label" for="monto">Monto</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-fw fa-dollar-sign"></i></span>
                    </div>
                    <input id="montoEdit" type="number" class="form-control form-control-sm" name="monto"
                      value="{{ old('monto') }}" placeholder="* Monto" min="0" step="0.01" required>
                  </div>
                </div>

                {{-- Concepto --}}
                <div class="form-group">
                  <label class="form-label" for="concepto">Concepto</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                    </div>
                    <input type="text" class="form-control form-control-sm" id="conceptoEdit" name="concepto"
                      placeholder="* Concepto" required>
                  </div>
                </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
              </div>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>
@stop

@push('js')
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    function obtenerInfoEdi(id, fecha, descripcion, monto) {
      $('#idIngreso').val(id);
      $('#fecha').val(fecha);
      $('#conceptoEdit').val(descripcion);
      $('#montoEdit').val(monto);

      const fechaObj = new Date(fecha);
      const anio = fechaObj.getFullYear();
      $('#anioEdit').val(anio);
    }
    $(document).ready(function() {
      $('.eliminar-ingreso').on('click', function() {
        let referencia = $(this).data('referencia');

        Swal.fire({
          title: '¿Está seguro?',
          text: 'Va a eliminar el ingreso #' + referencia + ', esta acción no se puede deshacer. ¿Continuar?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Sí, eliminar',
          cancelButtonText: 'Cancelar'
        }).then((result) => {
          if (result.isConfirmed) {
            $(this).closest('form').submit();
          }
        });

        return false;
      });
      $('#ModalEdit').on('shown.bs.modal', function(e) {
        $('#Categoria').focus();
      });
      $("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
        $("#success-alert").slideUp(500);
      });
    });
  </script>

  <style>
    .mascotas {
      margin: 0;
      padding: 10px;
      list-style-type: none;
      text-align: left;
    }

    .form {
      display: inline;
    }
  </style>
@endpush
