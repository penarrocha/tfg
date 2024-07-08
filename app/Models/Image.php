<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Image extends Model {

    function __construct() {
        $this->table = 'images';
        $this->guarded = [];
        parent::__construct();
    }

    public function imageable() : MorphTo {
        return $this->morphTo();
    }
}
