@section('title', 'Buscador')
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/song.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/song.js') }}" />
@endsection
@section('afterCssFiles')
@endsection

@extends('common.body')
@section('content')

<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Buscador</li>
    </ol>
</nav>
<section>
    @if (count($results) === 0)
    <div class="bg bg-warning text-white p-3">
        <i class="fas fa-frown"></i> La búsqueda <code class="query"><i class="fas fa-quote-left"></i>{{ $q }}<i class="fas fa-quote-right"></i></code> no ha devuelto resultados.
    </div>
    @else
    Buscando ... <code class="query">{{ $q }}</code>
    @endif
</section>

@endsection