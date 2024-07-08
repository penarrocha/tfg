<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;

class Album extends Pivot {

    protected array $authors;/* = [];
    protected $table = 'albums';
    protected $guarded = ['*'];
    protected $fillable = ['*'];*/

    function __construct() {
        $this->table = 'albums';
        $this->guarded = [];
        $this->fillable = [];
        $this->authors = [];
        
        parent::__construct();
    }

    public function label() : BelongsTo {
        return $this->belongsTo(Label::class, 'label_id');
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
        return $this->belongsToMany(Song::class, AlbumSong::class, 'album_id', 'song_id')
                    ->withPivot('ordering_text')
                    ->orderByPivot('ordering', 'asc');
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

    public function date() : string {
        if ($this->released_at !== null){
            return Carbon::createFromFormat('Y-m-d', $this->released_at)->translatedFormat('j \d\e F \d\e Y');
        }
        return $this->released_year;
    }

    public function autor() : array {
        if (empty($this->authors)){
            $artists = $this->artists;
            $relations = $this->relationships;
            $count = $artists->count();
            for ($i = 0; $i < $count; $i++){
                $this->authors[] = [
                    'id' => $artists[$i]->id, 
                    'author' => $artists[$i]->artist, 
                    'alias' => $artists[$i]->alias, 
                    'relationship' => $relations[$i]->relationship
                ];
            }
        }
        return $this->authors;
    }

    public function autor2() : array {
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

    public function stylesNotLinkable(string $glue = ' | ') : string {
        return implode($glue, $this->stylesArray());
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
