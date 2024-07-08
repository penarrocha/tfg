@section('title', 'Aviso legal')
@if (false)
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/legal.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/legal.js') }}" />
@endsection
@endif
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Aviso legal</li>
    </ol>
</nav>
<h1><span class="fa-solid fa-bullhorn" aria-hidden="true"></span> Aviso legal</h1>

<p>Redactar...</p>

@if (false)
@section('afterJsFiles')
<script src="{{ asset('assets/js/legal.js') }}"></script>
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/legal.css') }}" />
@endsection
@endif
@endsection