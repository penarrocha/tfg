<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class Song extends Model {
    use HasFactory;

    function __construct() {
        $this->table = 'songs';
        $this->guard = [];
        parent::__construct();
    }

    public function albums() : BelongsToMany {
        return $this->belongsToMany(Album::class, AlbumSong::class, 'song_id', 'album_id')
                    ->withPivot('relationship_id')
                    ->orderByPivot('ordering', 'ASC');
    }

    public function videos() : MorphMany {
        return $this->morphMany(Video::class, 'videoable');
    }

    public function comments() : MorphMany {
        return $this->morphMany(Comment::class, 'commentable');
    }
}
