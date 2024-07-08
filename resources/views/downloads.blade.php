@section('title', 'Descargas / Downloads')
@if (false)
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/downloads.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/downloads.js') }}" />
@endsection
@endif
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Descargas</li>
    </ol>
</nav>
<h1><span class="fa-solid fa-download" aria-hidden="true"></span> Descargas</h1>
<div class="bg bg-info p-3 mt-5 fs-2">
    <span class="fa-solid fa-gears" aria-hidden="true"></span> El contenido de esta sección está en construcción.
</div>
<p class="mt-4 fs-4"><span class="fa-solid fa-frown" aria-hidden="true"></span> Lo sentimos, estamos trabajando para que esta sección esté operativa lo antes posible. ¡Permanece atento/a!</p>
@if (false)
@section('afterJsFiles')
<script src="{{ asset('assets/js/downloads.js') }}"></script>
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/downloads.css') }}" />
@endsection
@endif
@endsection