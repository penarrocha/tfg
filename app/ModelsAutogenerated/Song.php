<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Song
 * 
 * @property int $id
 * @property int $album_id
 * @property string $song
 * @property string|null $duration
 * @property string|null $lyrics
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Album $album
 * @property Collection|Album[] $albums
 * @property Collection|Artist[] $artists
 * @property Collection|SongVote[] $song_votes
 *
 * @package App\Models
 */
class Song extends Model
{
	protected $table = 'songs';

	protected $casts = [
		'album_id' => 'int'
	];

	protected $fillable = [
		'album_id',
		'song',
		'duration',
		'lyrics'
	];

	public function album()
	{
		return $this->belongsTo(Album::class);
	}

	public function albums()
	{
		return $this->belongsToMany(Album::class)
					->withPivot('id', 'ordering', 'ordering_text');
	}

	public function artists()
	{
		return $this->belongsToMany(Artist::class)
					->withPivot('id');
	}

	public function song_votes()
	{
		return $this->hasMany(SongVote::class);
	}
}
