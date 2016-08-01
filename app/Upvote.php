<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Upvote extends Model {

	//

	public function user() {
		return $this->belongsTo('\App\User');
	}

	public function task() {
		return $this->belongsTo('\App\Task');
	}

	// MUTATORS

	public function setUpovoterIdAttribute($value) {
		//
	}


	// RABIS MUTATORJA, KI BO PRED VNOSOM V BAZO PREVERJAL, DA upvoter_id NI ISTI
	// KOT upvoted_id (NE MORES VZPODBUDIT SAMEGA SEBE)


}
