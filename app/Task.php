<?php namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Task extends Model {

	protected $table = 'zadolzitve';

	protected $primaryKey = 'id_zadolzitve';

	


	public function user() {
		return $this->belongsTo('\App\User');
	}

	//MUTATORS
	
	public function setStatusAttribute() {
		return $this->attributes['status'] = 0;
	}


	// QUERY SCOPES
	
	public function scopeSeek($query, $id) {
		return $query->findOrFail($id);
	}
	
	/**
	 * pick $quantity of most voted tasks
	 *
	 * @param  Task $query   
	 * @param  int $quantity
	 * @return Task          
	 */
	public function scopeBest($query, $quantity) {
		return $query->orderBy('votes', 'desc')->take($quantity);
	}

	public function scopeOrder($query, $way) {
		return $query->orderBy('created_at', $way);
	}

	/**
	 * filter done tasks
	 * @param  Task $query 
	 * @return Task
	 */
	public function scopeDone($query, $id) {

		if($query->select('updated_at')) {
			return $query->where('updated_at', '>', Carbon::now());
		}
		return $query->where('created_at', '>', Carbon::now());
	}

	/**
	 * filter tasks, which are not yet done
	 */
	public function scopePending($query) {

		if($query->select('updated_at')) {
			return $query->where('updated_at' <= Carbon::now());
		}
		return $query->where('created_at' <= Carbon::now());
	}

}
