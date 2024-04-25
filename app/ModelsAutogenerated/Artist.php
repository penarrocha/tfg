<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Artist
 * 
 * @property int $id
 * @property string $artist
 * @property string $alias
 * @property string|null $url
 * @property string|null $description
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|Album[] $albums
 * @property Collection|Song[] $songs
 *
 * @package App\Models
 */
class Artist extends Model
{
	protected $table = 'artists';

	protected $fillable = [
		'artist',
		'alias',
		'url',
		'description'
	];

	public function albums()
	{
		return $this->belongsToMany(Album::class)
					->withPivot('id', 'relationship_id', 'ordering');
	}

	public function songs()
	{
		return $this->belongsToMany(Song::class)
					->withPivot('id');
	}
}
