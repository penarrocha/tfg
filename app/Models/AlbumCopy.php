<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Support\Str;

class AlbumCopy extends Pivot {

    function __construct() {
        $this->table = 'albums';
        $this->guard = [];
        
        parent::__construct();
    }

    public function label() : BelongsTo {
        return $this->belongsTo(Label::class);
    }

    public function artists() : BelongsToMany {
        return $this->belongsToMany(Artist::class, AlbumArtist::class, 'album_id', 'artist_id')
                    ->withPivot('relationship_id')
                    ->orderByPivot('ordering', 'ASC');
    }

    public function artist() : BelongsToMany {
        return $this->belongsToMany(Artist::class, AlbumArtist::class, 'album_id', 'artist_id')
                    ->withPivot('relationship_id')
                    ->orderByPivot('ordering', 'ASC');
    }

    public function relationship() : BelongsToMany {
        return $this->belongsToMany(Relationship::class, AlbumArtist::class, 'album_id', 'relationship_id')
                    ->withPivot('relationship_id')
                    ->orderByPivot('ordering', 'ASC');
    }

    public function relationships() : BelongsToMany {
        return $this->belongsToMany(Relationship::class, AlbumArtist::class, 'album_id', 'relationship_id')
                    ->withPivot('relationship_id')
                    ->orderByPivot('ordering', 'ASC');
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

    public function autor() : array {
        $authors = [];
        $artists = $this->artists;
        $relations = $this->relationships;
        for ($i = 0; $i < count($artists); $i++){
            $authors[] = [
                'id' => $artists[$i]->id, 
                'author' => $artists[$i]->artist, 
                'alias' => $artists[$i]->alias, 
                'relationship' => $relations[$i]->relationship
            ];
        }
        /*
        foreach ($this->artists as $artist){
            $authors[] = [
                'id' => $artist->id, 
                'author' => $artist->artist, 
                'alias' => $artist->alias, 
                //'relationship' => $artist->pivot->relationship->relationship
                'relationship' => $artist->relationship
            ];
        }
        */
        
        return $authors;
    }

    public function authorToArray() : array {
        $albumAuthors = $this->autor();
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
        $authors = [];
        $albumAuthors = $this->autor();
        foreach ($albumAuthors as $a){
            $authors[] = sprintf('<a href="%s" class="link artist">%s</a>', route('artist', [$a['alias']]), $a['author']);
            if ($a['relationship'] !== Relationship::NO_RELATION){
                $authors[] = $a['relationship'];
            }
        }
        /*
        $albumAuthors = $this->autor();
        foreach ($albumAuthors as $a){
            $authors[] = sprintf('<a href="%s" class="link artist">%s</a>', route('artist', [$a['alias']]), $a['author']);
            if ($a['relationship'] !== Relationship::NO_RELATION){
                $authors[] = $a['relationship'];
            }
        }
        */
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

    public function stylesArray() : array {
        $albumStyles = $this->styles;
        $styles = [];
        foreach ($albumStyles as $s){
            $styles[] = $s->style;
        }
        return $styles;
    }

    public function albumLinkable() : string {
        return sprintf('<a href="%s" class="link album">%s</a>', $this->link(), $this->album);
    }

    public function link() : string {
        return route('album', [$this->id, Str::slug($this->authorToString(), '-'), $this->alias]);
    }

}
