<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Image extends Model {
    use HasFactory;

    function __construct() {
        $this->table = 'images';
        $this->guard = [];
        parent::__construct();
    }

    public function imageable() : MorphTo {
        return $this->morphTo();
    }
}
