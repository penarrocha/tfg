<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Relationship
 * 
 * @property int $id
 * @property string|null $relationship
 *
 * @package App\Models
 */
class Relationship extends Model
{
	protected $table = 'relationships';
	public $timestamps = false;

	protected $fillable = [
		'relationship'
	];
}
