<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Hierarchy extends Model {

	protected $table = 'hierarchies';

	protected $primaryKey = 'id';

	protected $fillable = ['parent_id', 'name'];



	public static function boot() {

		parent::boot();

		static::saving(function($model) {

			$ids = self::select('id')->get()->lists('id')->toArray();

			if( ! in_array($model->parent_id, $ids)) {
				return false;
			}

			$last_id = self::orderBy('id', 'desc')->pluck('id');
			$model->id = intval($last_id)+1;
			return true;
		});

	}


	public function users() {
		return $this->belongsToMany('\App\User', 'hierarchies_users')->withPivot('hierarchy_id');
	}


	/**
	 * This function returns immedtate children hierarhcy elements of given hierarchy_id
	 */
	public function childrenElements() {
		return $this->hasMany('\App\Hierarchy', 'parent_id', 'id');
	}

	/**
	 * This function returns all child hierarhcy elements of given hierarchy_id
	 */
	public function allChildrenElements() {
		return $this->childrenElements()->with('allChildrenElements');
	}

	
	//MUTATORS




	// ACCESSORS
	
/*	public function getIdAttribute() {
		return intval($this->attributes['id']);
	}
*/
	// QUERY SCOPES
	
	/**
	 * returns elements without children (leafs)
	 */
	public function scopeChildless($query)
	{
   		$query->has('childrenElements', '=', 0);
	}
}
