@extends('adminlte::page')

@section('title', 'Consultorio veterinario SOS |Configuracion')

@php
$heads = [
        'Fecha Registro' ,
        'Fecha actualizacion',
        'Unidad de Medida',
        'opciones',
    ];
$config = [
    'language' => [
        'url' => '//cdn.datatables.net/plug-ins/2.0.1/i18n/es-ES.json',
        ],
];    
@endphp

@section('content_header')
    <h1 class="m-0 text-dark"><i class="fas fa-cogs"></i>  Configuracion</h1>
@stop

@section('content')
<div class="card card-info">
    <div class="card-header">
        <h3 class="card-title">Unidad de Medida</h3>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-toggle="modal" data-target="#ModalNew" title="Nueva Unidad de Medida" ><i class="fas fa-plus"></i>
            </button>
        </div>
    </div>
    <div class="card-body">
        @if (session('msg'))
         <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <x-adminlte-alert theme="success" id='success-alert' title="" dismissable>
                {{session('msg')}}
                </x-adminlte-alert> 
            </div>
        </div>
        @endif 
        <div class="row">
            <x-adminlte-datatable  id="DataUnidadMedida" :heads="$heads" head-theme="light" striped hoverable bordered compressed beautify  with-buttons :config="$config" >
                @foreach ($unidadMedida as $um)
                <tr>
                    <td>{{$um->created_at}}</td>
                    <td>{{$um->updated_at}}</td>
                    <td>{{$um->UnidadMedida}}</td>
                    <td>
                        <button type="button" class="btn btn-xs btn-default text-primary mx-1 shadow" data-toggle="modal" data-target="#ModalEdit" 
                            title="Editar Unidad de Medida" onclick="obtenerInfoEdi('{{$um->UnidadMedida}}', '{{$um->id}}')"><i class="fa fa-lg fa-fw fa-pen"></i>
                        </button>
                        
                    </td>
                    
                </tr>
                @endforeach
            </x-adminlte-datatable>  
        </div>
        <!-- Modal -->
        <div class="modal fade " id="ModalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Modificar Unidad de Medida</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="{{ url('unidadMedida/1') }}" method="post">
                    @method("PUT")
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control form-control-sm" id="IdUnidadMedida" name="IdUnidadMedida" value="" placeholder="IdUnidadMedida" readonly>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-vial"></i></span>
                                    </div>
                                    <input type="text" class="form-control form-control-sm" id="UnidadMedida" name="UnidadMedida" value="" placeholder="* Unidad Medida" required>
                                </div>
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

        <!-- Modal New-->
        <div class="modal fade " id="ModalNew" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Crear Nueva Unidad de Medida</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="{{ url('unidadMedida') }}" method="post">
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-vial"></i></span>
                                    </div>
                                    <input type="text" class="form-control form-control-sm" id="UnidadMedida" name="UnidadMedida" value="" placeholder="* Unidad de Medida" required>
                                </div>
                            </div>
                            <div class="col-md-8"></div>
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
    </div>
</div>
@stop

@push('js')
<script>
    function obtenerInfoEdi(datos, id) {
            $('#UnidadMedida').val(datos);
            $('#IdUnidadMedida').val(id);
        }
    $(document).ready(function() {
        $('#ModalEdit').on('shown.bs.modal', function (e) {
            $('#UnidadMedida').focus();
        });
        $("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
            $("#success-alert").slideUp(500);
        });
    });
</script>
@endpush