<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AlbumSong extends Model {
    use HasFactory;

    function __construct() {
        $this->table = 'album_song';
        $this->guard = [];
        parent::__construct();
    }

    public function album() : BelongsTo {
        return $this->belongsTo(Album::class, 'album_id', 'id');
    }

    public function song() : BelongsTo {
        return $this->belongsTo(Song::class, 'song_id', 'id');
    }
}
