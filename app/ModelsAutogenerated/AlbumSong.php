<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class AlbumSong
 * 
 * @property int $id
 * @property int $album_id
 * @property int $song_id
 * @property int $ordering
 * @property string|null $ordering_text
 * 
 * @property Album $album
 * @property Song $song
 *
 * @package App\Models
 */
class AlbumSong extends Model
{
	protected $table = 'album_song';
	public $timestamps = false;

	protected $casts = [
		'album_id' => 'int',
		'song_id' => 'int',
		'ordering' => 'int'
	];

	protected $fillable = [
		'album_id',
		'song_id',
		'ordering',
		'ordering_text'
	];

	public function album()
	{
		return $this->belongsTo(Album::class);
	}

	public function song()
	{
		return $this->belongsTo(Song::class);
	}
}
