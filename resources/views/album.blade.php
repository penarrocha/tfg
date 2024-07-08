@section('title', $album->authorToString() . ' - ' . $album->album . ' (' . $album->released_year . ')')
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/album.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/album.js') }}" />
@endsection
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item"><a href="{!! route('albums') !!}">Álbumes</a></li>
      <li class="breadcrumb-item">{!! $album->authorLinkable() !!}</li>
      <li class="breadcrumb-item active" aria-current="page">{{ $album->album }}</li>
    </ol>
</nav>
<h1 class="album-title">{!! $album->authorLinkable() !!} - {{ $album->album }}</h1>
<div class="row">
  <div class="col-12 col-md-6 col-lg-5">
    <p><span class="fa-regular fa-calendar" aria-hidden="true"></span> Fecha de lanzamiento: {{ $album->date() }}</p>
    <p><span class="fa-solid fa-record-vinyl" aria-hidden="true"></span> Discográfica: {{ $album->label->label }}</p>
    <p><span class="fa-solid fa-music" aria-hidden="true"></span> Estilo: {!! $album->stylesLinkable() !!}</p>
    <h2 class="tracklist"><span class="fa-solid fa-list-ol" aria-hidden="true"></span> Tracklist / Lista de canciones <span class="fa-regular fa-clock d-block float-end align-text-bottom fs-3 mt-2" title="Duración" aria-hidden="true"></span></h2>
    {{--  </code> tiene {{ $songs->count() }} canciones:</p> --}}
    <ul class="album-tracklist" id="album-tracklist">
      @foreach ($songs as $song)
      <li data-url="{!! $song->link($album->authorToString()) !!}"><span class="track-ordering">{{ $song->pivot->ordering_text ?? $loop->iteration }}</span>{{--
        @if ($song->pivot->ordering_text !== null)
        <span class="track-ordering">{{ $song->pivot->ordering_text }}</span>
        @endif 
        --}}
        <span class="track-name">{!! $song->songLinkable($album->authorToString()) !!}</span>
        <span class="track-duration">{{ $song->duration }}</span></li>
      @endforeach 
    </ul>
  </div>
  <div class="col-12 col-md-6 col-lg-7">
    @if ($album->images->count() > 0)
    <div id="albumCarousel" class="carousel slide carousel-fade mb-5">
      <div class="carousel-indicators">
        @foreach ($album->images as $i)
        <button type="button" class="{{ $loop->first ? 'active' : '' }}" data-bs-target="#albumCarousel" data-bs-slide-to="{{ $loop->index }}" aria-current="{{ $loop->index === 0 ? 'true' : 'false' }}" aria-label="Imagen {{ $loop->iteration }}"></button>
        @endforeach 
      </div>
      <div class="carousel-inner">
        @foreach ($album->images as $image)
        <div class="carousel-item{{ $loop->first ? ' active' : '' }}">
          <img src="{{ asset($image->src) }}" class="d-block w-100" alt="{{ $image->description ?? sprintf('Imagen #%d del álbum %s - %s', $loop->iteration, $album->authorToString(), $album->album) }}" />
          @if ($image->description !== null)
          <div class="carousel-caption album-caption d-none d-md-block">
            <p>{{ $image->description }}</p>
          </div>
          @endif
        </div>
      @endforeach
      </div>
      <button class="carousel-control-prev album-carousel-control" type="button" data-bs-target="#albumCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon album-carousel-control-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Anterior</span>
      </button>
      <button class="carousel-control-next album-carousel-control" type="button" data-bs-target="#albumCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Siguiente</span>
      </button>
    </div>
    @endif
  </div>
</div>
@if ($album->description !== null)
<div class="album-description">
  <h3 class="album-description-heading">Descripción del álbum {{ $album->album }}: {{ $album->album }}</h3>
  {!! $album->description !!}
</div>
@endif
<p class="album-views views-number">Número de visualizaciones del álbum: {{ $album->views }}</p>
@endsection
@section('afterJsFiles')
<script src="{{ asset('assets/js/album.js') }}"></script>
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/album.css') }}" />
@endsection