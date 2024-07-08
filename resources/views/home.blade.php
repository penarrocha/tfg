@section('title', env('APP_NAME'))
@extends('common.body')
@section('content')
<div class="text-center">
    <p class="h1 mb-5">Bienvenidos a <span class="site-name">{{ env('APP_NAME') }}</span></p>
    <img class="img-responsive" src="{{ asset('assets/images/vinyl.png') }}" alt="{{ env('APP_NAME') }}" />
</div>
<p class="text-center mt-4 offset-md-2 col-8">Esta página es mi Trabajo Final de Grado, correspondiente al Grado en Ingeniería Informática dentro del itinerario curricular concreto de curso de adaptación - 2014</p>
{{--
<div class="server-info text-center mt-3">
    <h4><code>Información del SGBD</code></h4>
    <dl class="row">
        <dt class="col-3 text-end">Server</dt><dd class="col-9">{{ env('DB_CONNECTION') }}</dd>
        <dt class="col-3 text-end">Port</dt><dd class="col-9">{{ env('DB_PORT') }}</dd>
        <dt class="col-3 text-end">Database</dt><dd class="col-9">{{ env('DB_DATABASE') }}</dd>
    </dl>
</div>
--}}
@endsection