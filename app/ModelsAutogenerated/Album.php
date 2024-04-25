<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Album
 * 
 * @property int $id
 * @property int $label_id
 * @property string $album
 * @property string $alias
 * @property Carbon|null $released_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Label $label
 * @property Collection|Artist[] $artists
 * @property Collection|Song[] $songs
 * @property Collection|Style[] $styles
 *
 * @package App\Models
 */
class Album extends Model
{
	protected $table = 'albums';

	protected $casts = [
		'label_id' => 'int',
		'released_at' => 'datetime'
	];

	protected $fillable = [
		'label_id',
		'album',
		'alias',
		'released_at'
	];

	public function label()
	{
		return $this->belongsTo(Label::class);
	}

	public function artists()
	{
		return $this->belongsToMany(Artist::class)
					->withPivot('id', 'relationship_id', 'ordering');
	}

	public function songs()
	{
		return $this->hasMany(Song::class);
	}

	public function styles()
	{
		return $this->belongsToMany(Style::class)
					->withPivot('id');
	}
}
