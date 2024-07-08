<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class SearchController extends Controller {

    public function index(Request $request): View {
        $q = $request->q;
        $results = [];

        return view('search', ['results' => $results, 'q' => $q]);
    }
    
}
