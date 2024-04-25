@section('title', $style->style . ' - Estilos musicales')
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item"><a href="{!! route('styles') !!}">Géneros musicales</a></li>
      <li class="breadcrumb-item active" aria-current="page">{{ $style->style }}</li>
    </ol>
</nav>
<h1>{{ $style->style }}</h1>
<p>Tenemos {{ $albums->count() }} álbums -con un total de {{ $songsNumber }} canciones- del estilo {{ $style->style }}</p>
<ul>
    @foreach($albums as $album)
        <li>{!! $album->authorLinkable() !!} - {!! $album->albumLinkable() !!} ({{ $album->released_year }}) [{!! $album->stylesLinkable() !!}]</li>
    @endforeach
</ul>
@endsection
