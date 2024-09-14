@extends('adminlte::page')
@section('title', 'Consultorio veterinario SOS | Reportes de Contabilidad')

@php
  $currentYear = date('Y');
@endphp

@section('content_header')
  <h1 class="m-0 text-dark"><i class="fas fa-fw fa-file-alt"></i> Reportes de Contabilidad</h1>
@stop

@section('content')
  <div class="card card-success">
    <div class="card-header">
      <h3 class="card-title">Generar Reporte</h3>
    </div>
    <form action="{{ url('contabilidad/reportes') }}" method="post">
      @csrf
      <div class="card-body">
        @if ($errors->any())
          <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <ul>
              @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
              @endforeach
            </ul>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            </button>
          </div>
        @endif

        <div class="row">
          <div class="form-group col-md-4">
            <label class="form-label" for="tipo_reporte">Tipo de Reporte</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-fw fa-balance-scale"></i></span>
              </div>
              <select class="form-control form-control-sm" id="tipo_reporte" name="tipo_reporte" required>
                <option value="" disabled selected>* Tipo de Reporte...</option>
                <option value="1">Estado de Resultado</option>
                <option value="2">Balance General</option>
                <option value="3">Estado de flujo de efectivo</option>
              </select>
            </div>
          </div>
          <div class="form-group col-md-4">
            <label class="form-label" for="fecha_inicio">Fecha Inicio</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-fw fa-calendar"></i></span>
              </div>
              <input type="date" class="form-control form-control-sm" id="fecha_inicio" name="fecha_inicio"
                value="{{ $currentYear }}-01-01" readonly>
            </div>
          </div>
          <div class="form-group col-md-4">
            <label class="form-label" for="fecha_final">Fecha Final</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-fw fa-calendar"></i></span>
              </div>
              <input type="date" class="form-control form-control-sm" id="fecha_final" name="fecha_final"
                value="{{ old('fecha_final') }}" min="{{ $currentYear }}-01-01" max="{{ $currentYear }}-12-31" required>
            </div>
          </div>
        </div>
      </div>

      <div class="card-footer">
        <div class="row">
          <div class="col-md-12">
            <div class="d-grid gap-3 d-md-block">
              <button type="submit" class="btn bg-gradient-primary btn-sm btn-accion"><i
                  class="fas fa-fw fa-file-alt"></i>
                Generar Reporte</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>

@stop

@push('js')
  <script>
    $(document).ready(function() {});
  </script>

  <style>

  </style>
@endpush
