@section('title', $song->song . ' - ' . $album->authorToString())
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/song.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/song.js') }}" />
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/song.css') }}" />
@endsection
@section('afterJsFiles')
@endsection
@extends('common.body')
@section('content')


<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item"><a href="{!! route('artists') !!}">Artistas</a></li>
      <li class="breadcrumb-item">{!! $album->authorLinkable() !!}</li>
      <li class="breadcrumb-item">{!! $album->albumLinkable() !!}</li>
      <li class="breadcrumb-item active" aria-current="page">{{ $song->song }}</li>
    </ol>
</nav>

<h1 class="song-title">{{ $song->song }}</h1>
<h2 class="song-artist">Artist: {!!  $album->authorLinkable() !!}</h2>
<h3 class="song-album">Álbum: {!! $album->albumLinkable() !!} ({{ $album->released_year }})</h3>
<p class="song-views mb-5">Nº visitas: {{ $song->views }}</p>
@if ($song->videos->count())
    <div class="row">
        <div class="col-12 col-md-6 col-lg-8">
            <div id="videoContainer">
                @if ($song->videos->count() > 1)
                <div id="videoCarousel" class="carousel slide carousel-fade mb-5">
                    <div class="carousel-indicators">
                    @foreach ($song->videos as $video)
                    <button type="button" class="{{ $loop->first ? 'active' : '' }}" data-bs-target="#videoCarousel" data-bs-slide-to="{{ $loop->index }}" aria-current="{{ $loop->index === 0 ? 'true' : 'false' }}" aria-label="Vídeo #{{ $loop->iteration }}"></button>
                    @endforeach 
                    </div>
                    <div class="carousel-inner">
                        @foreach ($song->videos as $video)
                        <div class="carousel-item{{ $loop->first ? ' active' : '' }}">
                            {!! $video->embed() !!}
                        </div>
                    @endforeach 
                    </div>
                </div>
                @else 
                {!! $song->videos->first()->embed() !!}
                @endif 
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
@endif
@if ($song->lyrics)
<h4 class="song-lyrics-title">Letra de {{ $song->song }}</h4>
<div class="song-lyrics {{ $song->videos->count() ? 'with-video' : '' }}" id="song-{{ $song->id }}">
    {!! nl2br($song->lyrics) !!}
</div>
@else
<h4 class="song-lyrics-title">Letra de {{ $song->song }}</h4>
<div class="song-no-lyrics" id="song-{{ $song->id }}">
    <p>Según nuestros registros, la canción {{ $song->song }} es instrumental, por lo que no tiene letra.</p>
    <p>Si crees que se trata de un error y/o puedes proporcionarnos la letra de esta canción, por favor, emplea el 
        formulario de contacto para hacérnosla llegar.</p>
</div>
@endif 
@if ($song->videos->count())
        </div>
        <div class="clearfix"></div>
    </div>
@endif 
@if ($album->songs->count() > 1)
<div class="other-album-songs">
    <h5>Otras canciones del álbum {{ $album->album }}</h5>
    <ul class="album-other-songs">
        @foreach ($album->songs as $s)
        <li>@if ($s->pivot->ordering_text !== null)
            <span class="other-album-songs-ordering">{{ $s->pivot->ordering_text }}</span>
            @endif 
            @if ($s->id !== $song->id)
            <a href="{!! $s->link($authorString) !!}">{{ $s->song }}</a>@else<span class="current-album-song">{{ $s->song }}</span>
            @endif
        </li>
        @endforeach
    </ul>
</div>
@endif
@endsection