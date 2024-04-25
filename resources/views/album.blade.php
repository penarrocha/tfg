@section('title', $album->album . ' (' . $album->released_year . ') - ' . $album->authorToString())
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
    <p><i class="fa-regular fa-calendar"></i> Fecha de lanzamiento: {{ $album->date() }}</p>
    <p><i class="fa-solid fa-record-vinyl"></i> Discográfica: {{ $album->label->label }}</p>
    <p><i class="fa-solid fa-music"></i> Estilo: {!! $album->stylesLinkable() !!}</p>
    <h2 class="tracklist"><i class="fa-solid fa-list-ol"></i> Tracklist / Lista de canciones <i class="fa-regular fa-clock d-block float-end align-text-bottom fs-3 mt-2" title="Duración"></i></h2>
    {{--  </code> tiene {{ $songs->count() }} canciones:</p> --}}
    <ul class="album-tracklist" id="album-{{ $album->id }}">
      @foreach ($songs as $song)
      <li><span class="track-ordering">{{ $song->pivot->ordering_text ?? $loop->iteration }}</span>{{--
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
        </div>
      @endforeach
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#albumCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Anterior</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#albumCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Siguiente</span>
      </button>
    </div>
    @endif
  </div>
</div>
@endsection
@section('afterJsFiles')
<script src="{{ asset('assets/js/album.js') }}"></script>
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/album.css') }}" />
@endsection