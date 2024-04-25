<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AlbumStyle extends Model {
    use HasFactory;

    function __construct() {
        $this->table = 'album_style';
        $this->guard = [];
        parent::__construct();
    }
    
    public function album() : BelongsTo {
        return $this->belongsTo(Album::class, 'album_id', 'id');
    }


    public function style() : BelongsTo {
        return $this->belongsTo(Style::class, 'style_id', 'id');
    }
}
