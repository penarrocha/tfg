<?php

namespace App\Http\Controllers;

use App\Models\Album;
use App\Models\Artist;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Http\Request;

class ArtistController extends Controller {

    public function index(): View {
        return view('artists', ['artists' => Artist::all()->sortBy('artist')]);
    }

    public function artist(string $alias): View {
        $artist = Artist::with(['albums', 'albums.relationships', 'albums.artists', 'images'])
                        ->where('alias', $alias)->firstOrFail();
        /*
        $artist = Artist::with(['albums', 'albums.relationships', 'albums.artists', 'images'])
                        ->join('artists AS a', 'a.alias', '=', $alias)
                        //->join('artists AS a', function(JoinClause $join){
                        //    $join->on('aa.artist_id', '=', 'a.id')
                        //        ->where('aa.ordering', '=', 0);
                        //})
                        ->join('album_artist AS aa', 'a.id', '=', 'aa.artist_id')
                        ->join('albums AS alb', function(JoinClause $join){
                            $join->on('alb.id', '=', 'aa.album_id');
                        })
                        ->groupBy('aa.album_id')
                        //->where('a.alias', $alias)
                        ->orderBy('released_at', 'asc')
                        ->firstOrFail();
        */
        /*
        $artist = Artist::where('alias', $alias)->firstOrFail();
        $albums = Album::with(['styles', 'artists', 'label', 'relationships'])
                ->select(['albums.*', 'a.artist'])
                ->join('album_artist AS aa', 'albums.id', '=', 'aa.album_id')
                ->join('artists AS a', function(JoinClause $join) use ($alias){
                    $join->on('aa.artist_id', '=', 'a.id')
                        ->where('a.alias', $alias)
                        ->where('aa.ordering', '=', 0);
                })
                ->groupBy('aa.album_id')
                ->orderBy('a.artist', 'asc')
                ->orderBy('albums.released_at', 'asc')
                ->get();
        */
        return view('artist', [
            'artist' => $artist, 
            'albums' => $artist->albums
            //'albums' => $albums
        ]);
    }
    
}
