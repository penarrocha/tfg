<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Comment
 * 
 * @property int $id
 * @property int $user_id
 * @property string $comment
 * @property int $commentable_id
 * @property string|null $commentable_type
 * @property Carbon|null $date_created
 * 
 * @property User $user
 *
 * @package App\Models
 */
class Comment extends Model
{
	protected $table = 'comments';
	public $timestamps = false;

	protected $casts = [
		'user_id' => 'int',
		'commentable_id' => 'int',
		'date_created' => 'datetime'
	];

	protected $fillable = [
		'user_id',
		'comment',
		'commentable_id',
		'commentable_type',
		'date_created'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
