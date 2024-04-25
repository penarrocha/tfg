<?php

namespace App\Http\Controllers;

use App\Models\Album;
use App\Models\AlbumArtist;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Contracts\Database\Query\Builder as QueryBuilder;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder as EloquentBuilder;
use Illuminate\Http\Request;
use Illuminate\Database\Query\JoinClause;

class AlbumController extends Controller {
    
    public function index() : View {
        /*
        Album::select(['albums.*', 'a.artist'])
         */
        $albums = Album::with(['styles', 'artists', 'label', 'relationships'])
                ->select(['albums.*', 'a.artist'])
                ->join('album_artist AS aa', 'albums.id', '=', 'aa.album_id')
                ->join('artists AS a', function(JoinClause $join){
                    $join->on('aa.artist_id', '=', 'a.id')
                        ->where('aa.ordering', '=', 0);
                })
                ->groupBy('aa.album_id')
                ->orderBy('a.artist', 'asc')
                ->orderBy('albums.album', 'asc')
                ->get();
                //->paginate(50);
        return view('albums', ['albums' => $albums]);
    }

    public function album(int $id, string $author, string $alias) : View {
        
        //$album = Album::where('id', '=', $id)->firstOrFail();
        $album = Album::with(['songs', 'styles', 'label', 'images'])
                        ->select(['albums.*', 'a.artist'])
                        //->join('album_artist AS aa', 'albums.id', '=', 'aa.album_id')
                        ->join('album_artist AS aa', function(JoinClause $join) use ($id){
                            $join->on('albums.id', '=', 'aa.album_id')
                                ->where('albums.id', '=', $id);
                        })
                        ->join('artists AS a', function(JoinClause $join){
                            $join->on('aa.artist_id', '=', 'a.id')
                                ->where('aa.ordering', '=', 0);
                        })
                        ->groupBy('aa.album_id')
                        ->orderBy('a.artist', 'asc')
                        //->where('albums.id', '=', $id)
                        ->firstOrFail();
        return view('album', ['album' => $album, 'songs' => $album->songs]);
    }
}
