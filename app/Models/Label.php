<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Label extends Model {

    function __construct() {
        $this->table = 'labels';
        $this->guard = [];
        parent::__construct();
    }

}
