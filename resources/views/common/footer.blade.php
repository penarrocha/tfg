
    <footer id="footer" class="footer mt-auto py-5 bg-dark text-white">
      <div class="container">
        <p class="float-end mb-1">
          <a href="#" id="backToTop">Back to top</a>
        </p>
        <p class="mb-1">EuroDanceLyrics &copy; {{ date('Y') }}</p>
      </div>
    </footer>
    <div id="search-modal" class="modal" tabindex="-1">
      <div class="modal-dialog modal-fullscreen">
        <div class="modal-content vh-100 bg-color-{{ rand(1,5) }}">
          <button type="button" class="btn-close btn-close-white" id="search-modal-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
          <div class="justify-content-center modal-dialog-centered flex-column" id="search-modal-content">
            <div class="col-10 col-md-7 col-lg-5 col-xl-4">
              <div id="search-modal-info-close">Pulsa la tecla <code>Esc</code> o sobre la X para cerrar</div>
              <form class="" id="search-form" role="search">
                <div class="input-group">
                  <input class="form-control form-control-lg me" type="search" name="q" id="q" placeholder="Grupo, álbum, título o parte de la letra de la canción" aria-label="Search">
                  <button class="btn btn-lg btn-primary" type="submit"><i class="fa-solid fa-search"></i></button>
                </div>
              </form>
              <div id="search-modal-advanced-info">... o prueba nuestro buscador avanzado</div>
            </div>
          </div>
        </div>
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
