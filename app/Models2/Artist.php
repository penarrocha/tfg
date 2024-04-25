<?php
/*
 * 
 * Illuminate\Database\Eloquent\Concerns\GuardsAttributes
 * 
*/

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Support\Facades\DB;

class Artist extends Pivot {
    use HasFactory;

    protected int $numberOfSongs = 0;
    protected ?\Illuminate\Support\Collection $songs = null;
    
    function __construct() {
        $this->table = 'artists';
        $this->guard = [];
        parent::__construct();
    }

    public function albums() : BelongsToMany {
        return $this->belongsToMany(Album::class, AlbumArtist::class, 'artist_id', 'album_id')
                    ->withPivot('relationship_id')
                    ->orderByPivot('ordering', 'ASC');
    }

    public function albums2() : HasMany {
        return $this->hasMany(AlbumArtist::class, 'artist_id');
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

    public function albums3() : HasManyThrough {
        return $this->hasManyThrough(Album::class, AlbumArtist::class, 'artist_id', 'album_id');
    }

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
}
