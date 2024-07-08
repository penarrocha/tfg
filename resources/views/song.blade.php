@section('title', $album->authorToString() . ' - ' . $song->song . ' lyrics')
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/song.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/song.js') }}" />
{{--<link rel="preload" as="script" src="https://genius.codes" />--}}
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/song.css') }}" />
@endsection
{{-- 
@section('afterJsFiles')
<script src="https://genius.codes"></script>
@endsection
--}}

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

<p class="h1 song-title">{!!  $album->authorLinkable() !!} - {{ $song->song }}</p>
<p class="h2 song-album mt-3">Álbum: {!! $album->albumLinkable() !!} ({{ $album->released_year }})</p>
@if ($song->videos->count())
    <div class="row mt-5">
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
<p class="h3 song-lyrics-title">Letra de {{ $song->song }}</p>
<div class="song-lyrics {{ $song->videos->count() ? 'with-video' : '' }}" id="song-{{ $song->id }}">
    {!! nl2br($song->lyrics) !!}
</div>
@else
<p class="h3 song-lyrics-title">Letra de {{ $song->song }}</p>
<div class="song-no-lyrics" id="song-{{ $song->id }}">
    <p>No tenemos la letra de la canción <code class="song-title">{{ $song->song }}</code>.</p>
    <p>Si no es instrumental y puedes proporcionarnos su letra, por favor, emplea el formulario de contacto para hacérnosla llegar.</p>
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
<p class="song-views views-number">Número de visualizaciones de esta canción: {{ $song->views }}</p>
{{-- 
    <div id='rg_embed_link_1394' class='rg_embed_link' data-song-id='1394'>Read <a href='https://genius.com/Pink-floyd-shine-on-you-crazy-diamond-pts-1-5-lyrics'>“Shine On You Crazy Diamond, Pts. 1-5” by Pink Floyd</a> on Genius</div> <script crossorigin src='//genius.com/songs/1394/embed.js'></script>
--}}
@endsection