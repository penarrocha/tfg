<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\Pivot;

class AlbumSong extends Pivot {

    
    public function album() : BelongsTo {
        return $this->belongsTo(Album::class, 'album_id', 'id');
    }

    public function song() : BelongsTo {
        return $this->belongsTo(Song::class, 'song_id', 'id');
    }
}
