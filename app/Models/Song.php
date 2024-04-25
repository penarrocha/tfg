<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Support\Str;

class Song extends Model {

    function __construct() {
        $this->table = 'songs';
        $this->guard = [];
        parent::__construct();
    }

    public function album() : BelongsTo {
        return $this->belongsTo(Album::class);
    }

    public function albums() : BelongsToMany {
        return $this->belongsToMany(Album::class, AlbumSong::class, 'album_id', 'song_id');
    }

    public function videos() : MorphMany {
        return $this->morphMany(Video::class, 'videoable');
    }

    public function comments() : MorphMany {
        return $this->morphMany(Comment::class, 'commentable');
    }

    public function artists2() : BelongsToMany {
        return $this->belongsToMany(Artist::class, AlbumSong::class,  'song_id', 'artist_id',);
    }

    public function link(string $artist) : string {
        return route('song', ['id' => $this->id, 'alias' => Str::slug($artist . '-' . $this->song)]);
    }

    public function songLinkable(string $artist) : string {
        return sprintf('<a href="%s" class="link song">%s</a>', $this->link($artist), $this->song);
    }


}
