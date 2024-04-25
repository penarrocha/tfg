<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Video extends Model {
    use HasFactory;

    function __construct() {
        $this->table = 'videos';
        $this->guard = [];
        parent::__construct();
    }

    public function videoable() : MorphTo {
        return $this->morphTo();
    }

}
