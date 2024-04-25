<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AuthLdap {
    
    public function handle(Request $request, Closure $next) {
        if (rand(0, 100) < 50){
            return $next($request);
        }
    }
    
}
