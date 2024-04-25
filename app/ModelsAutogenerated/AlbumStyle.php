<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class AlbumStyle
 * 
 * @property int $id
 * @property int $album_id
 * @property int $style_id
 * 
 * @property Album $album
 * @property Style $style
 *
 * @package App\Models
 */
class AlbumStyle extends Model
{
	protected $table = 'album_style';
	public $timestamps = false;

	protected $casts = [
		'album_id' => 'int',
		'style_id' => 'int'
	];

	protected $fillable = [
		'album_id',
		'style_id'
	];

	public function album()
	{
		return $this->belongsTo(Album::class);
	}

	public function style()
	{
		return $this->belongsTo(Style::class);
	}
}
