<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Relationship extends Model {
    use HasFactory;

    const NO_RELATION = null;

    function __construct() {
        $this->table = 'relationships';
        $this->guard = [];
        parent::__construct();
    }

    
}
