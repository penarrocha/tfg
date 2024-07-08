
    <footer id="footer" class="footer mt-auto py-5 bg-dark text-white">
      <div class="container">
        <ul class="footer-info">
          <li class="d-none d-sm-inline-block"><span class="fa-solid fa-record-vinyl" aria-hidden="true"></span> {{ env('APP_NAME') }} &copy; {{ date('Y') }}</li>
          <li><a class="link-warning{{ Route::currentRouteName() === 'legal' ? ' active' : ''}}" href="{{ route('legal') }}">Aviso legal</a></li>
          <li><a class="link-warning{{ Route::currentRouteName() === 'contact' ? ' active' : ''}}" href="{{ route('contact') }}">Contacto</a></li>
          <li><a class="link-warning{{ Route::currentRouteName() === 'cookies' ? ' active' : ''}}" href="{{ route('cookies') }}">Política de cookies</a></li>
        </ul>
      </div>
    </footer>
    <div id="search-modal" class="modal" tabindex="-1">
      <div class="modal-dialog modal-fullscreen">
        <div class="modal-content vh-100 bg-color-{{ rand(1,5) }}">
          <button type="button" class="btn-close btn-close-white" id="search-modal-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
          <div class="justify-content-center modal-dialog-centered flex-column" id="search-modal-content">
            <div class="col-10 col-md-7 col-lg-5 col-xl-4">
              <div id="search-modal-info-close">Pulsa la tecla <code>Esc</code> o sobre la X para cerrar</div>
              <form class="" id="search-form" role="search" action="{{ route('search') }}" method="GET">
                <div class="input-group">
                  <label for="q" class="visually-hidden" aria-hidden="true">Buscar</label>
                  <input class="form-control form-control-lg me" type="search" name="q" id="q" placeholder="Grupo, álbum, título o parte de la letra de la canción" aria-label="Buscar">
                  <button class="btn btn-lg btn-primary" type="submit"><span class="fa-solid fa-search" aria-hidden="true"></span></button>
                </div>
              </form>
              {{--<div id="search-modal-advanced-info">... o prueba nuestro buscador avanzado</div>--}}
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="refresh-modal" class="modal" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered">
          <span class="fa-solid fa-spinner fa-spin-pulse fa-5x"></span>
      </div>
    </div>
    
    @yield('beforeJsFiles')
    @yield('beforeInlineJs')
    @yield('beforeCssFiles')
    @yield('beforeInlineCss')
    <link rel="stylesheet" href="{{ asset('assets/bootstrap-5.3.3-dist/css/bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fontawesome-6.5.2/css/fontawesome.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fontawesome-6.5.2/css/regular.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fontawesome-6.5.2/css/brands.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fontawesome-6.5.2/css/solid.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/css/common.css') }}" />
    <script src="{{ asset('assets/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/common.js') }}"></script>
    @yield('afterCssFiles')
    @yield('afterInlineCss')
    @yield('afterJsFiles')
    @yield('afterInlineJs') 
  </body>
</html>
