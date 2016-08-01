<?php namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Post extends Model {

	const CREATED_AT = 'created';
	const UPDATED_AT = 'updated';
	
	protected $table = 'qa_posts';
	
	protected $primaryKey = 'postid';

	//protected $dates = ['created', 'updated'];

	protected $hidden = ['cookieid', 'createip'];




	public function user() {
		return $this->belongsTo('\App\User', 'userid', 'userid');
	}

	public function parent() {
		return $this->belongsTo('\App\Post', 'parentid', 'parentid');
	}


	public function getCreatedAttribute() {
		return Carbon::parse($this->attributes['created']);
	}

	public function getUpdatedAttribute() {
		return Carbon::parse($this->attributes['updated']);
	}


	// QUERY SCOPES

	public function scopeSeek($query, $id) {
		return $query->findOrFail($id);
	}

	public function scopeHot($query, $quantity) {
		// določi, katere parametre boš vzel za hot
		return $query->orderBy('hotness', 'desc')->take($quantity);
	}

	public function scopeNew($query, $quantity) {
		return $query->orderBy('created', 'desc')->take($quantity);
	}

	public function scopeMonthly($query, $month) {
		return $query->where('created', $month);
	}

	public function scopeQuestions($query, $visible=true) {
		return $visible ? $query->where('type','Q') : $query->where('type','Q_HIDDEN');
	}

	public function scopeAnswers($query, $visible=true) {
		return $visible ? $query->where('type','A') : $query->where('type','A_HIDDEN');
	}

	public function scopeComments($query, $visible=true) {
		return $visible ? $query->where('type','C') : $query->where('type','C_HIDDEN');
	}

	public function scopeHidden($query) {
		return $query->where('type', 'LIKE', '%_HIDDEN%');
	}

	public function scopeVisible($query) {
		return $query->whereNotIn('type', 'LIKE', '%_HIDDEN%');
	}

	public function scopeOwner($query, $id) 
	{
		return $query->where('userid', $id);
	}


}
