<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\Pivot;

class AlbumStyle extends Pivot {

    public function album() : BelongsTo {
        return $this->belongsTo(Album::class);
    }
    
    public function style() : BelongsTo {
        return $this->belongsTo(Style::class);
    }
}
