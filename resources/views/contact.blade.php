@section('title', 'Contacto')
@if (false)
@section('preloadFiles')
<link rel="preload" as="style" src="{{ asset('assets/css/contact.css') }}" />
<link rel="preload" as="script" src="{{ asset('assets/js/contact.js') }}" />
@endsection
@endif
@extends('common.body')
@section('content')
<nav aria-label="breadcrumb" id="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{!! route('home') !!}">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Contacto</li>
    </ol>
</nav>
<h1><span class="fa-solid fa-address-card" aria-hidden="true"></span> Contacto</h1>

<p>Redactar...</p>

@if (false)
@section('afterJsFiles')
<script src="{{ asset('assets/js/contact.js') }}"></script>
@endsection
@section('afterCssFiles')
<link rel="stylesheet" href="{{ asset('assets/css/contact.css') }}" />
@endsection
@endif
@endsection