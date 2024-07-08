<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class IndexController extends Controller {
    
    public function index() : View {
        return view('home');
    }

    public function contacto() : View {
        return view('contact');
    }

    public function legal() : View {
        return view('legal');
    }

    public function cookies() : View {
        return view('cookies');
    }
}
