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
        //$albums = AlbumArtist::all()->groupBy('album_id')->sortBy('artist.artist');
        /*$albumsArtists = AlbumArtist::join('albums AS a', function(JoinClause $join){
                $join->on('artist_id', '=', 'a.id')
                    ->orderBy('artist', 'ASC');
                })
                ->with('albums')->get();*/
    //->join('album_song AS asong', 'aa.album_id', '=', 'asong.album_id')
        /*->get();/*
        $albums = Album::join('album_artist', function(JoinClause $join){
            $join->groupBy('album_id');
            })->join('artists', function(JoinClause $join){
                $join->where('artist_id', $)->orderBy('artist ASC');
            });
            echo $albums->toSql();die;*/
        
        //$albums = Album::all();
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
        /*else{
            $albums = Album::with(['artists' => function(Builder $query){
                $query->where('album_artist.artist_id', '=', 'artists.id')
                    ->where('album_artist.ordering', '=', 0)
                    ->groupBy('album_artist.album_id')
                    ->orderBy('artist', 'asc');
            }, 'styles'])
            ->orderBy('album', 'asc')
            ->get();
        }*/
        
        return view('albums', ['albums' => $albums]);
    }

    public function album(int $id, string $author, string $alias) : View {
        $album = Album::with('artists')
                        ->with('songs')
                        ->where('id', '=', $id)
                        //->where('alias', '=', $alias)
                        ->firstOrFail();
        return view('album', ['album' => $album, 'songs' => $album->songs]);
    }
}
