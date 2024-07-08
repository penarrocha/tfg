<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Support\Facades\DB;

class Style extends Model {

    protected int $numberOfSongs = -1;
    protected ?\Illuminate\Support\Collection $songs = null;

    protected $fillable = ['style', 'alias', 'description'];

/*
    function __construct() {
        $this->table = 'styles';
        //$this->guarded = [];
        $this->fillable = ['style', 'alias', 'description'];
        //$this->fillable = [];
        
    }*/

    public function albums() : BelongsToMany {
        //return $this->belongsToMany(Album::class)->withPivot('id')->using(AlbumStyle::class);
        return $this->belongsToMany(Album::class, AlbumStyle::class, 'style_id', 'album_id');
    }

    public function link() : string {
        return sprintf('<a href="%s" class="link style">%s</a>', route('style', ['alias' => $this->alias]), $this->style);
    }

    public function getLink() : string {
        return route('style', ['alias' => $this->alias]);
    }
    
    public function getNumberOfSongs() : int {
        if ($this->numberOfSongs < 0){
            $query = DB::table('styles AS st')
                        ->selectRaw('COUNT(*) AS numero')
                        ->join('album_style AS ast', function(JoinClause $join){
                            $join->on('ast.style_id', '=', 'st.id')
                                ->where('st.id', '=', DB::raw($this->id));
                        })
                        ->join('album_song AS aso', 'ast.album_id', '=', 'aso.album_id')
                        ->join('songs AS s', 'aso.song_id', '=', 's.id');
            $this->numberOfSongs = $query->first()->numero;
        }
        return $this->numberOfSongs;
    }

    public function numberOfSongs() : int {
        $songs = 0;
        $albums = $this->albums;
        foreach ($albums as $album){
            $songs += $album->songs->count();
        }
        return $songs;
    }

    /*
    public function getSongs2() : \Illuminate\Support\Collection {
        if ($this->songs === null){
            $songs = Style::where('alias', '=', $this->alias)
                        ->with('albums')
                        ->with('artists')
                        ->with('songs')
                        ->get();

            $this->songs = $songs;
            //dd($songs);
        }
        return $this->songs;
    }

    public function getSongs() : \Illuminate\Support\Collection {
        if ($this->songs === null){
            $query = DB::table('styles AS s')
                        ->join('album_style AS ast', function(JoinClause $join){
                            $join->on('s.id', '=', 'ast.style_id')->whereRaw('s.alias=:alias', ['alias' => $this->alias]);
                        })
                        ->join('albums AS a', 'ast.album_id', '=', 'a.id')
                        ->join('album_song AS asong', 'a.id', '=', 'asong.album_id')
                        ->join('songs', function (JoinClause $join){
                            $join->on('asong.song_id', '=', 'songs.id');//->whereNotNull('songs.lyrics');
                        });
            //echo '<pre>' . $query->toSql() . '</pre>';
            $this->songs = $query->get();
            $this->numberOfSongs = $this->songs->count();
        }
        return $this->songs;
    }

    public function getNumberOfSongs() : int {
        if ($this->numberOfSongs === 0){
            $query = DB::table('album_song AS as')
                        ->join('albums AS a', 'as.album_id', '=', 'a.id')
                        ->join('songs AS s', function (JoinClause $join){
                            $join->on('as.song_id', '=', 's.id');//->whereNotNull('s.lyrics');
                        });
            $this->numberOfSongs = $query->count();
        }
        return $this->numberOfSongs;
    }
    */
}