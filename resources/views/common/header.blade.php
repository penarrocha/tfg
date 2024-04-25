<!doctype html>
<html lang="es" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="@yield('description')">
    <meta name="author" content="Iván Peñarrocha">
    <title>@yield('title')</title>
    <link rel="preload" as="style" src="{{ asset('assets/bootstrap-5.3.3-dist/css/bootstrap.min.css') }}" />
    <link rel="preload" as="style" src="{{ asset('assets/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js') }}" />
    <link rel="preload" as="style" src="{{ asset('assets/fontawesome-6.5.2/css/fontawesome.min.css') }}" />
    <link rel="preload" as="style" src="{{ asset('assets/fontawesome-6.5.2/css/regular.min.css') }}" />
    <link rel="preload" as="style" src="{{ asset('assets/fontawesome-6.5.2/css/brands.min.css') }}" />
    <link rel="preload" as="style" src="{{ asset('assets/fontawesome-6.5.2/css/solid.min.css') }}" />
    <link rel="preload" as="style" src="{{ asset('assets/css/common.css') }}" />
    <link rel="preload" as="script" src={{ asset('assets/js/common.js') }} />
    @yield('preloadFiles')
    @yield('beforeBodyJsFiles')
    @yield('beforeBodyInlineJs')
  </head>
  {{-- <body class="@yield('bodyClass', 'edl') d-flex flex-column vh-100" id="@yield('bodyId', 'body')">--}}
  <body class="@yield('bodyClass', 'edl') d-flex h-100 flex-column" id="@yield('bodyId', 'body')">
  <header class="fixed-navbar">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <div class="container-fluid">
        <span class="navbar-brand">{{ Config::get('app.name') }}</span>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenuCollapse" aria-controls="navbarMenuCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarMenuCollapse">
          <ul class="navbar-nav mb-2 mb-md-0 d-flex me-auto">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#" title="Inicio"><i class="fa-solid fa-home"></i></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('albums') }}">Álbumes</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('artists') }}" >Artistas / Grupos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('styles') }}" >Estilos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('downloads') }}" >Descargas</a>
            </li>
          </ul>
          {{--
          <div class="d-flex">
            <div class="input-group">
              <div class="form-outline" data-mdb-input-init>
                <input type="search" id="form1" class="form-control" />
                <label class="form-label" for="form1">Search</label>
              </div>
              <button type="button" class="btn btn-primary" data-mdb-ripple-init>
                <i class="fas fa-search"></i>
              </button>
            </div>
              poner el buscador como en getbootstrap.com
              <div class="bd-search" id="docsearch" data-bd-docs-version="5.3"><button type="button" class="DocSearch DocSearch-Button" aria-label="Search"><span class="DocSearch-Button-Container"><svg width="20" height="20" class="DocSearch-Search-Icon" viewBox="0 0 20 20" aria-hidden="true"><path d="M14.386 14.386l4.0877 4.0877-4.0877-4.0877c-2.9418 2.9419-7.7115 2.9419-10.6533 0-2.9419-2.9418-2.9419-7.7115 0-10.6533 2.9418-2.9419 7.7115-2.9419 10.6533 0 2.9419 2.9418 2.9419 7.7115 0 10.6533z" stroke="currentColor" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg><span class="DocSearch-Button-Placeholder">Search</span></span><span class="DocSearch-Button-Keys"><kbd class="DocSearch-Button-Key"><svg width="15" height="15" class="DocSearch-Control-Key-Icon"><path d="M4.505 4.496h2M5.505 5.496v5M8.216 4.496l.055 5.993M10 7.5c.333.333.5.667.5 1v2M12.326 4.5v5.996M8.384 4.496c1.674 0 2.116 0 2.116 1.5s-.442 1.5-2.116 1.5M3.205 9.303c-.09.448-.277 1.21-1.241 1.203C1 10.5.5 9.513.5 8V7c0-1.57.5-2.5 1.464-2.494.964.006 1.134.598 1.24 1.342M12.553 10.5h1.953" stroke-width="1.2" stroke="currentColor" fill="none" stroke-linecap="square"></path></svg></kbd><kbd class="DocSearch-Button-Key">K</kbd></span></button></div>

            <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-label="Toggle navigation">
              <svg class="bi" aria-hidden="true"><use xlink:href="#three-dots"></use></svg>
            </button>
          </div>
          --}}
          {{--
          <form class="d-flex w-25" id="header-search-form" role="search">
            <div class="input-group">
              <input class="form-control me" type="search" placeholder="Buscar por grupo, álbum, canción o letra de canción" aria-label="Search">
              <button class="btn btn-primary" type="submit"><i class="fa-solid fa-search"></i></button>
            </div>
          </form>
          --}}
          <div class="d-flex" id="header-search">
            <div class="input-group">
                <span class="form-control">Buscar ...</span>
                <button class="btn btn-primary"><i class="fa fa-search"></i></button>
            </div>
          </div>
          {{--
          <div class="d-flex justify-content-center h-100">
            <div class="search">
                <input type="text" class="search-input" placeholder="search..." name="">
                <a href="#" class="search-icon">
                    <i class="fa fa-search"></i>
                </a>
            </div>
        </div>
        --}}
        </div>
      </div>
    </nav>
  </header>
