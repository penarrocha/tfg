<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Style
 * 
 * @property int $id
 * @property string $style
 * @property string $alias
 * @property string|null $description
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|Album[] $albums
 *
 * @package App\Models
 */
class Style extends Model
{
	protected $table = 'styles';

	protected $fillable = [
		'style',
		'alias',
		'description'
	];

	public function albums()
	{
        return $this->belongsToMany(Album::class, AlbumArtist::class, 'artist_id', 'album_id')
                    ->withPivot('relationship_id')
                    ->orderByPivot('ordering', 'ASC');
	}
    public function link() : string {
        return sprintf('<a href="%s" class="link style">%s</a>', route('style', ['alias' => $this->alias]), $this->style);
    }
}
