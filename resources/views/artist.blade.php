@section('title', $artist->artist)
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/artist.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/artist.js') }}" />
@endsection
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
    <li class="breadcrumb-item"><a href="{!! route('artists') !!}">Artistas</a></li>
    <li class="breadcrumb-item active" aria-current="page">{{ $artist->artist }}</li>
  </ol>
</nav>
<p class="h1">{{ $artist->artist }}</p>
<div class="row">
  <div class="col-12{{ $artist->images->count() > 0 ? ' col-sm-6 col-md-5 col-lg-4' : ''}}">
    <p>Tenemos {{ $albums->count() }} álbum{{ $albums->count() > 1 ? 'es' : '' }} de <code>{{ $artist->artist }}</code></p>
    <ul class="artist-albums">
        @foreach ($albums as $album)
        <li>{!! $album->authorLinkable() !!} - {!! $album->albumLinkable() !!} ({{ $album->released_year }})</li>
        @endforeach
    </ul>
  </div>
  @if ($artist->images->count() > 0 || $artist->description !== null)
  <div class="col-12 col-sm-6 col-md-7 col-lg-8">
    <div id="artistCarousel" class="carousel slide carousel-fade mb-5">
      <div class="carousel-indicators">
        @foreach ($artist->images as $i)
        <button type="button" class="{{ $loop->first ? 'active' : '' }}" data-bs-target="#artistCarousel" data-bs-slide-to="{{ $loop->index }}" aria-current="{{ $loop->index === 0 ? 'true' : 'false' }}" aria-label="Imagen {{ $loop->iteration }}"></button>
        @endforeach 
      </div>
      <div class="carousel-inner">
        @foreach ($artist->images as $image)
        <div class="carousel-item{{ $loop->first ? ' active' : '' }}">
          <img src="{{ asset($image->src) }}" class="d-block w-100" alt="{{ $image->description }}" />
        </div>
      @endforeach
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#artistCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Anterior</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#artistCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Siguiente</span>
      </button>
    </div>
    @if ($artist->description != null)
    <div class="artist-description">
      {!! $artist->description !!}
    </div>
    @endif 
  </div>
  @endif
</div>
@endsection
@section('afterJsFiles')
<script src="{{ asset('assets/js/artist.js') }}"></script>
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/artist.css') }}" />
@endsection