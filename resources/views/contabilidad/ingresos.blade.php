@extends('adminlte::page')

@section('title', 'Consultorio veterinario SOS | Ingresos')

@php
  $heads = ['Fecha Registro', 'ID', 'Tipo', 'Método de Pago' ,'Concepto', 'Monto', 'Acciones'];
  $config = [
      'language' => [
          'url' => '//cdn.datatables.net/plug-ins/2.0.1/i18n/es-ES.json',
      ],
      'order' => [],
  ];

@endphp

@section('content_header')
  <h1 class="m-0 text-dark"><i class="fas fa-fw fa-coins"></i> Ingresos</h1>
@stop

@section('content')
  <div class="card card-primary">
    <div class="card-header">
      <h3 class="card-title">Listado de Ingresos</h3>
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

      <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
        <div class="btn-group mr-2" role="group" aria-label="Third group">
          <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#ModalNew"
            title="Nuevo Ingreso">Registrar ingreso</button>
        </div>
      </div>

      <hr>

      <div class="row">
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
                  <button type="submit" class="eliminar-venta delete btn btn-xs btn-default text-danger mx-1 shadow"
                    title="Eliminar venta {{ $ingreso_referencia }}" data-referencia="{{ $ingreso_referencia }}">
                    <i class="fa fa-lg fa-fw fa-trash"></i>
                  </button>

                  @method('DELETE')
                  @csrf
                </form>
              </td>
            </tr>
          @endforeach
        </x-adminlte-datatable>
      </div>

      <!-- Modal Create -->
      <div class="modal fade " id="ModalNew" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header bg-warning">
              <h5 class="modal-title" id="exampleModalCenterTitle">Registrar Nuevo Ingreso</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="{{ url('ingresos') }}" method="post">
              @csrf
              <div class="modal-body">
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

                {{-- Tipo de Ingreso --}}
                <div class="form-group">
                  <label class="form-label" for="tipo_ingreso">Tipo de Ingreso</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-fw fa-credit-card"></i></span>
                    </div>
                    <select class="form-control form-control-sm" id="tipo_ingreso" name="tipo_transaccion" required>
                      <option value="" disabled selected>* Tipo de Ingreso...</option>
                      <option value="ingreso_venta">Ingreso por venta</option>
                      <option value="ingreso_servicio">Ingreso por servicio</option>
                    </select>
                  </div>
                </div>

                {{-- Forma de Pago --}}
                <div class="form-group">
                  <label class="form-label" for="forma_pago">Forma de Pago</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-fw fa-credit-card"></i></span>
                    </div>
                    <select class="form-control form-control-sm" id="forma_pago" name="forma_pago" required>
                      <option value="" disabled selected>* Forma de Pago...</option>
                      <option value="efectivo">Efectivo</option>
                      <option value="transferencia">Transferencia</option>
                    </select>
                  </div>
                </div>

                {{-- Monto --}}
                <div class="form-group">
                  <label class="form-label" for="monto">Monto</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-fw fa-dollar-sign"></i></span>
                    </div>
                    <input id="monto" type="number" class="form-control form-control-sm" name="monto"
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
                    <input type="text" class="form-control form-control-sm" id="concepto" name="concepto"
                      value="" placeholder="* Concepto" required>
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
  <script>
    function obtenerInfoEdi(id, fecha, descripcion, monto) {
      $('#idIngreso').val(id);
      $('#fecha').val(fecha);
      $('#conceptoEdit').val(descripcion);
      $('#montoEdit').val(monto);      
    }
    $(document).ready(function() {
      $('.eliminar-venta').on('click', function() {
        let referencia = $(this).data('referencia');

        if (confirm('Va a eliminar la venta ' + referencia + ', esta acción no se puede deshacer. ¿Continuar?')) {
          return true;
        }

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
