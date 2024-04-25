<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\Pivot;

class Album extends Pivot {
    use HasFactory;

    function __construct() {
        $this->table = 'albums';
        $this->guard = [];
        
        parent::__construct();
    }

    public function label() : BelongsTo {
        return $this->belongsTo(Label::class, 'label_id', 'id');
    }

    public function artists() : BelongsToMany {
        return $this->belongsToMany(Artist::class, AlbumArtist::class, 'album_id', 'artist_id')
                    ->withPivot('relationship_id')
                    ->orderByPivot('ordering', 'ASC');
    }

    public function songs2() : HasMany {
        return $this->hasMany(Song::class, 'id', 'song_id');
    }

    public function songs() : BelongsToMany {
        return $this->belongsToMany(Song::class, AlbumSong::class, 'album_id', 'song_id');
    }

    public function styles() : BelongsToMany {
        return $this->belongsToMany(Style::class, AlbumStyle::class, 'album_id', 'style_id');
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

    public function author() : array {
        $authors = [];
        $artists = $this->artists;
        foreach ($artists as $artist){
            $authors[] = [
                'id' => $artist->id, 
                'author' => $artist->artist, 
                'alias' => $artist->alias, 
                'relationship' => $artist->pivot->relationship->relationship
            ];
        }
        
        return $authors;
    }

    public function authorToArray() : array {
        $albumAuthors = $this->author();
        $authors = [];

        foreach ($albumAuthors as $a){
            $authors[] = $a['author'];
            if ($a['relationship'] !== Relationship::NO_RELATION){
                $authors[] = $a['relationship'];
            }
        }
        return $authors;
    }

    public function authorToString() : string {
        return implode(' ', $this->authorToArray());
    }

    public function authorLinkable() : string {
        $albumAuthors = $this->author();
        $authors = [];

        foreach ($albumAuthors as $a){
            $authors[] = sprintf('<a href="%s" class="link artist">%s</a>', route('artist', [$a['alias']]), $a['author']);
            if ($a['relationship'] !== Relationship::NO_RELATION){
                $author[] = $a['relationship'];
            }
        }
        return implode(' ', $authors);
    }

    public function stylesLinkable(string $glue = ' | ') : string {
        $albumStyles = $this->styles;
        $styles = [];
        foreach ($albumStyles as $s){
            $styles[] = $s->link();
        }
        return implode($glue, $styles);
    }

    public function albumLinkable() : string {
        return sprintf('<a href="%s" class="link album">%s</a>', route('album', [$this->alias]), $this->album);
    }


}
