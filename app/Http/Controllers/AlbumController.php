<?php

namespace App\Http\Controllers;

use App\Models\Album;
use Illuminate\Contracts\View\View;

class AlbumController extends Controller {
    
    public function index() : View {
        $albums = Album::with(['styles', 'artists', 'label', 'relationships'])
                ->select(['albums.*', 'a.artist'])
                ->join('album_artist AS aa', 'albums.id', '=', 'aa.album_id')
                ->join('artists AS a', 'aa.artist_id', '=', 'a.id')
                ->groupBy('aa.album_id')
                ->orderBy('a.artist', 'asc')
                ->orderBy('albums.album', 'asc')
                ->get();
        return view('albums', ['albums' => $albums]);
    }
    
    public function album(int $id, string $author, string $alias) : View {
        $album = Album::with(['songs', 'styles', 'label', 'images'])
                        ->select(['albums.*', 'a.artist'])
                        ->join('album_artist AS aa', 'albums.id', '=', 'aa.album_id')
                        ->join('artists AS a', 'aa.artist_id', '=', 'a.id')
                        ->groupBy('aa.album_id')
                        ->orderBy('a.artist', 'asc')
                        ->where('albums.id', '=', $id)
                        ->firstOrFail();
        $album->increment('views');
        return view('album', ['album' => $album, 'songs' => $album->songs]);
    }

    public function test() : View{
        return view('albums-test', ['albums' => Album::all()->where('id', '<>', 20)]);
    }
}
