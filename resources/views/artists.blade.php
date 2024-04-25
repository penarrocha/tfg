@section('title', 'Artistas / Grupos musicales')
@if (false)
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/artists.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/artists.js') }}" />
@endsection
@endif
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Artistas</li>
    </ol>
</nav>
<h1>Bandas / Artistas</h1>
<ul>
    @foreach ($artists as $artist)
    <li>{!! $artist->link() !!}</li>
    @endforeach
</ul>
@if (false)
@section('afterJsFiles')
<script src="{{ asset('assets/js/artists.js') }}"></script>
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/artists.css') }}" />
@endsection
@endif
@endsection