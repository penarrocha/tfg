<?php

namespace App\Http\Controllers;

use App\Models\Album;
use App\Models\Artist;
use App\Models\Song;
use Illuminate\Http\Request;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Support\Facades\DB;

class SongController extends Controller {
    
    public function song(int $id, string $alias) : View {
        /*
        $song = Song::with(['albums'])
                    ->join('albums', 'songs.album_id', '=', 'albums.id')
                    ->join('album_song AS albsong', function(JoinClause $join) use ($id){
                        $join->on('albums.id', '=', 'albsong.album_id')
                        ->where('albums.id', '=', $id);
                    })
                    ->where('albums.id', '=', $id)
                    ->get();
        */
        $song = Song::with(['album'])->findOrFail($id);
        //$song = Song::findOrFail($id);
        $album = Album::with(['songs', 'relationships', 'artists', 'videos'])->findOrFail($song->album->id);
        /*
        ++$song->views;
        $song->save();
        */
        $song->increment('views');
        return view('song', ['song' => $song, 'id' => $id, 'album' => $album, 'authorString' => $album->authorToString()]);
    }
}
