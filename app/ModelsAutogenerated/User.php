<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property int $id
 * @property string $email
 * @property string $nickname
 * @property string|null $name
 * @property string|null $password
 * 
 * @property Collection|Comment[] $comments
 * @property Collection|SongVote[] $song_votes
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'users';
	public $timestamps = false;

	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'email',
		'nickname',
		'name',
		'password'
	];

	public function comments()
	{
		return $this->hasMany(Comment::class);
	}

	public function song_votes()
	{
		return $this->hasMany(SongVote::class);
	}
}
