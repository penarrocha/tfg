<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Relationship extends Model {

    const NO_RELATION = null;

    function __construct() {
        $this->table = 'relationships';
        $this->guarded = [];
        parent::__construct();
    }
    
    
}
