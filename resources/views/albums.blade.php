@section('title', 'Álbumes')
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Álbumes</li>
    </ol>
</nav>
<h1 class="mb-3">Álbumes</h1>
@if ($albums->count() > 0)
    <ul class="albumes" id="albumes">
    @foreach($albums as $album)
        <li>{!! $album->authorLinkable() !!} - {!! $album->albumLinkable() !!} 
            ({{ $album->released_year }}, 
            {!! $album->stylesLinkable() !!}{{--, 
            {{ $album->label->label }}--}})</li>
    @endforeach
    </ul>
@else
<p>No hay ningún álbum</p>
@endif 

@endsection