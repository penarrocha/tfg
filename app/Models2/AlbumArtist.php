<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\Pivot;

class AlbumArtist extends Pivot {
    use HasFactory;

    function __construct() {
        $this->table = 'album_artist';
        $this->guard = [];
    }

    public function album() : BelongsTo {
        return $this->belongsTo(Album::class, 'album_id', 'id');
    }

    public function artist() : BelongsTo {
        return $this->belongsTo(Artist::class, 'artist_id', 'id');
    }

    public function relationship() : BelongsTo {
        return $this->belongsTo(Relationship::class, 'relationship_id', 'id');
    }
}
