<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Image
 * 
 * @property int $id
 * @property string $url
 * @property string $format
 * @property string|null $description
 * @property int $imageable_id
 * @property string $imageable_type
 * @property int $ordering
 *
 * @package App\Models
 */
class Image extends Model
{
	protected $table = 'images';
	public $timestamps = false;

	protected $casts = [
		'imageable_id' => 'int',
		'ordering' => 'int'
	];

	protected $fillable = [
		'url',
		'format',
		'description',
		'imageable_id',
		'imageable_type',
		'ordering'
	];
}
