<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\Pivot;

class AlbumArtist extends Pivot {

    public function albums() : BelongsTo {
        return $this->belongsTo(Album::class)->groupBy('album_id');
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
    /*
    public function album() : BelongsTo {
        return $this->belongsTo(Album::class);
    }

    public function artist() : BelongsTo {
        return $this->belongsTo(Artist::class);
    }

    public function relationship() : BelongsTo {
        return $this->belongsTo(Relationship::class);
    }
    */

}
