<?php

use App\Http\Controllers\AlbumController;
use App\Http\Controllers\ArtistController;
use App\Http\Controllers\StyleController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DownloadController;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\SongController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [IndexController::class, 'index'])->name('home');
Route::get('/albums', [AlbumController::class, 'index'])->name('albums');
Route::get('/album/{id}-{author}-{alias}.html', [AlbumController::class, 'album'])->name('album'); 
Route::get('/artists', [ArtistController::class, 'index'])->name('artists');
Route::get('/artist/{alias}.html', [ArtistController::class, 'artist'])->name('artist');
Route::get('/styles', [StyleController::class, 'index'])->name('styles');
Route::get('/style/{alias}.html', [StyleController::class, 'style'])->name('style');
Route::get('/song/{id}-{alias}.html', [SongController::class, 'song'])->name('song');
Route::get('/downloads', [DownloadController::class, 'index'])->name('downloads');
#Route::get('/login', function () { return redirect('/admin'); })->name('login');


#Route::get('/user', ['UserController', 'index'])->middleware('is-active');
//Route::get('/user', ['UserController', 'index'])->middleware('AuthLdap');
/*
Route::middleware(['AuthLdap'])->group(function(){
    Route::get('/user', 'UserController@index');
    return view('user');
});
*/