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
<div class="row card-styles">
@foreach ($styles as $style)
<div class="col-sm-6 col-md-4 col-lg-3 mb-4">
  <div class="card">
    <a href="{{ $style->getLink() }}">
      <div class="card-header h5 text-center">
        <h5 class="card-title">{{ $style->style }} <span class="style-albums-number">{{ $style->albums->count() }}</span></h5>
      </div>
    <div class="card-body" style="padding:0">
      <img src="assets/images/styles/{{ $style->src }}" class="card-img-top img-fluid rounded-0" alt="Discos del estilo {{ $style->style }}" />
    </div>{{--
    <div class="card-footer">
      <p class="card-text">{{ $style->albums->count() }} álbumes</p>
    </div>--}}
    </a>
  </div>
</div>
@endforeach 
</div>
{{--
<ul>
    @foreach ($styles as $style)
    <li>{!! $style->link() !!} ({{ $style->albums->count() }} álbums, {{ $style->numberOfSongs() }} canciones)</li>
    @endforeach
</ul>--}}
@endsection