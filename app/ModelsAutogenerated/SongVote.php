<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class SongVote
 * 
 * @property int $id
 * @property int $song_id
 * @property int $user_id
 * @property int $vote
 * @property Carbon $created_at
 * 
 * @property Song $song
 * @property User $user
 *
 * @package App\Models
 */
class SongVote extends Model
{
	protected $table = 'song_votes';
	public $timestamps = false;

	protected $casts = [
		'song_id' => 'int',
		'user_id' => 'int',
		'vote' => 'int'
	];

	protected $fillable = [
		'song_id',
		'user_id',
		'vote'
	];

	public function song()
	{
		return $this->belongsTo(Song::class);
	}

	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
