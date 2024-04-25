@section('title', 'Géneros musicales')
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Géneros musicales</li>
    </ol>
</nav>
<h1>Estilos</h1>
<p>Tenemos discos de los siguientes géneros musicales:</p>
<ul>
    @foreach ($styles as $style)
    <li>{!! $style->link() !!} ({{ $style->albums->count() }} álbums, {{ $style->numberOfSongs() }} canciones)</li>
    @endforeach
</ul>
@endsection