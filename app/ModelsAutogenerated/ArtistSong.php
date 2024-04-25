<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class ArtistSong
 * 
 * @property int $id
 * @property int $artist_id
 * @property int $song_id
 * 
 * @property Artist $artist
 * @property Song $song
 *
 * @package App\Models
 */
class ArtistSong extends Model
{
	protected $table = 'artist_song';
	public $timestamps = false;

	protected $casts = [
		'artist_id' => 'int',
		'song_id' => 'int'
	];

	protected $fillable = [
		'artist_id',
		'song_id'
	];

	public function artist()
	{
		return $this->belongsTo(Artist::class);
	}

	public function song()
	{
		return $this->belongsTo(Song::class);
	}
}
