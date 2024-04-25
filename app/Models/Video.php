<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Video extends Model {

    const YOUTUBE = 'youtube';

    function __construct() {
        $this->table = 'videos';
        $this->guard = [];
        parent::__construct();
    }

    public function videoable() : MorphTo {
        return $this->morphTo();
    }

    public function embed() : string|null{
        if ($this->provider === self::YOUTUBE){
            return sprintf('<div class="videoWrapper"><iframe width="560" height="315" src="https://www.youtube.com/embed/%s" 
                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></div>', $this->source);
        }
        return null;
    }

}
