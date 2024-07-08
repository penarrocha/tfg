<?php
/*
 * 
 * Illuminate\Database\Eloquent\Concerns\GuardsAttributes
 * 
*/

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class Artist extends Pivot {

    protected int $numberOfSongs = 0;
    protected ?\Illuminate\Support\Collection $songs = null;
    
    function __construct() {
        $this->table = 'artists';
        $this->guarded = [];
        parent::__construct();
    }

    public function albums() : BelongsToMany {
        return $this->belongsToMany(Album::class, AlbumArtist::class, 'artist_id', 'album_id');
    }

    public function images() : MorphMany {
        return $this->morphMany(Image::class, 'imageable');
    }

    public function videos() : MorphMany {
        return $this->morphMany(Video::class, 'videoable');
    }

    public function comments() : MorphMany {
        return $this->morphMany(Comment::class, 'commentable');
    }
    
    public function link() : string {
        return sprintf('<a href="%s" class="link artist">%s</a>', route('artist', ['alias' => $this->alias]), $this->artist);
    }

    /**
     * Return the albums of an artist, ordered by date released (asc) and album name (asc)
     */
    public function albumes() : Collection {
        $albums = Album::with(['styles', 'artists', 'label', 'relationships'])
                ->select(['albums.*', 'a.artist'])
                ->join('album_artist AS aa', function(JoinClause $join){
                    $join->on('albums.id', '=', 'aa.album_id')
                        ->where('aa.artist_id', '=', $this->id);
                })
                ->join('artists AS a', function(JoinClause $join) {
                    $join->on('aa.artist_id', '=', 'a.id');
                        //->where('aa.ordering', '=', 0);
                })
                ->groupBy('aa.album_id')
                ->orderBy('a.artist', 'asc')
                ->orderBy('albums.released_year', 'asc')
                ->get();
        return $albums;
    }

    public function songs() : \Illuminate\Support\Collection {
        return Artist::join('album_artist AS aa', function(JoinClause $join){
                                $join->on('artists.id', '=', 'aa.artist_id')
                                    ->whereRaw('artists.alias=:alias', ['alias' => $this->alias]);
                        })
                        ->with('albums')
                        ->get();
    }

    public function getNumberOfSongs() : int {
        if ($this->numberOfSongs === 0){
            $query = DB::table('artists AS a')
                        ->select('*')
                        ->join('album_artist AS aa', function(JoinClause $join){
                            $join->on('a.id', '=', 'aa.artist_id')
                                ->whereRaw('a.alias=:alias', ['alias' => $this->alias]);
                        })
                        ->join('album_song AS asong', 'aa.album_id', '=', 'asong.album_id')
                        ->join('songs AS s', 'asong.song_id', '=', 's.id')
                        ->join('albums', 'asong.album_id', '=', 'albums.id');
            $this->numberOfSongs = $query->count();
        }
        return $this->numberOfSongs;
    }

    /*
    public function getSongs() : \Illuminate\Support\Collection {
        $songs = Artist::join('album_artist AS aa', function(JoinClause $join){
                                $join->on('artists.id', '=', 'aa.artist_id')
                                    ->whereRaw('artists.alias=:alias', ['alias' => $this->alias]);
                        })
                        //->join('album_song AS asong', 'aa.album_id', '=', 'asong.album_id')
                        ->with(['albums' => function ($query){
                            $query->with(['songs' => function($query){
                                $query->whereNotNull('s.lyrics');
                            }]);
                        }])
                        ->get();
        
        $songs2 = Artist::with([
            'albums' => function($query){
            }
        ])->whereRaw('alias=:alias', ['alias' => $this->alias])
        ->get();
        return $songs;
        dd($songs);

    }

    public function getSongs2() : \Illuminate\Support\Collection {
        if ($this->songs === null){
            $query = DB::table('artists AS a')
                        ->join('album_artist AS aa', function(JoinClause $join){
                            $join->on('a.id', '=', 'aa.artist_id')
                                ->whereRaw('a.alias=:alias', ['alias' => $this->alias]);
                        })
                        ->join('album_song AS asong', 'aa.album_id', '=', 'asong.album_id')
                        ->join('songs AS s', function(JoinClause $join){
                            $join->on('asong.song_id', '=', 's.id')
                            ->whereNotNull('s.lyrics');
                        })
                        ->join('albums', 'asong.album_id', '=', 'albums.id');
            //echo $query->toSql();die;
            $this->songs = $query->get();
            dd($this->songs[0]);
        }
        return $this->songs;
    }

    public function getNumberOfSongs() : int {
        if ($this->numberOfSongs === 0){
            $query = DB::table('artists AS a')
                        ->select('*')
                        ->join('album_artist AS aa', function(JoinClause $join){
                            $join->on('a.id', '=', 'aa.artist_id')
                                ->whereRaw('a.alias=:alias', ['alias' => $this->alias]);
                        })
                        ->join('album_song AS asong', 'aa.album_id', '=', 'asong.album_id')
                        ->join('songs AS s', function(JoinClause $join){
                            $join->on('asong.song_id', '=', 's.id')
                            ->whereNotNull('s.lyrics');
                        })
                        ->join('albums', 'asong.album_id', '=', 'albums.id');
                        
            //echo $query->toSql();die;
            $this->numberOfSongs = $query->count();
        }
        return $this->numberOfSongs;
    }
    */
}
