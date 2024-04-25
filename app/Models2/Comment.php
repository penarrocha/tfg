<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Comment extends Model {
    use HasFactory;

    function __construct() {
        $this->table = 'comments';
        $this->guard = [];
        parent::__construct();
    }

    public function commentable() : MorphTo {
        return $this->morphTo();
    }
}
