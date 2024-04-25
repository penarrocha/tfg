<?php

namespace App\Http\Controllers;

use App\Models\Style;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class DownloadController extends Controller {
    
    public function index() : View {
        return view('downloads', ['downloads' => Style::all()]);
    }
}
