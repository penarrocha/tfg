<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class AlbumArtist
 * 
 * @property int $id
 * @property int $album_id
 * @property int $artist_id
 * @property int $relationship_id
 * @property int $ordering
 * 
 * @property Album $album
 * @property Artist $artist
 *
 * @package App\Models
 */
class AlbumArtist extends Model
{
	protected $table = 'album_artist';
	public $timestamps = false;

	protected $casts = [
		'album_id' => 'int',
		'artist_id' => 'int',
		'relationship_id' => 'int',
		'ordering' => 'int'
	];

	protected $fillable = [
		'album_id',
		'artist_id',
		'relationship_id',
		'ordering'
	];

	public function album()
	{
		return $this->belongsTo(Album::class);
	}

	public function artist()
	{
		return $this->belongsTo(Artist::class);
	}
}
