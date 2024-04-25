<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Label
 * 
 * @property int $id
 * @property string $label
 * @property string $alias
 * @property string|null $description
 * @property string|null $url
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|Album[] $albums
 *
 * @package App\Models
 */
class Label extends Model
{
	protected $table = 'labels';

	protected $fillable = [
		'label',
		'alias',
		'description',
		'url'
	];

	public function albums()
	{
		return $this->hasMany(Album::class);
	}
}
