<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable {
    use HasApiTokens, HasFactory, Notifiable;

    function __construct(){
        $this->table = 'users';

        // attributes that should be hidden for serialization.
        $this->hidden = ['password'];

        // attributes that should be cast.
        $this->casts = [
            'password' => 'hashed'
        ];

        parent::__construct();
    }
    
}
