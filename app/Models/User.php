<?php

namespace App\Models;

use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements FilamentUser{
    use HasApiTokens, HasFactory, Notifiable;

    protected $guarded = [];
    protected $casts = ['password' => 'hashed'];
    /*
    protected $fillable = ['name', 'email'];

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
    */
    public function canAccessPanel(Panel $panel): bool {
        return true;
        //return str_ends_with($this->email, '@yourdomain.com') && $this->hasVerifiedEmail();
    }
    
}
