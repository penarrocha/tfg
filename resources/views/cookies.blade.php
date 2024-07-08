@section('title', 'Política de cookies')
@if (false)
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/downloads.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/downloads.js') }}" />
@endsection
@endif
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Política de cookies</li>
    </ol>
</nav>
<h1><span class="fa-solid fa-cookie-bite" aria-hidden="true"></span> Política de cookies</h1>

<p>Redactar...</p>

@if (false)
@section('afterJsFiles')
<script src="{{ asset('assets/js/downloads.js') }}"></script>
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/downloads.css') }}" />
@endsection
@endif
@endsection