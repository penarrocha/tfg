<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Video
 * 
 * @property int $id
 * @property string $provider
 * @property string $source
 * @property int $videoable_id
 * @property string $videoable_type
 * @property int|null $ordering
 *
 * @package App\Models
 */
class Video extends Model
{
	protected $table = 'videos';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'videoable_id' => 'int',
		'ordering' => 'int'
	];

	protected $fillable = [
		'provider',
		'source',
		'videoable_id',
		'videoable_type',
		'ordering'
	];
}
