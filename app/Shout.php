<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Shout extends Model {

	protected $table = 'shoutbox';

	protected $fillable = ['content'];
	

	public function user() {
		return $this->belongsTo('\App\User', 'userid', 'userid');
	}

	public static function boot() 
	{
		parent::boot();

		static::creating(function($shout) {
            $last_id = self::orderBy('id', 'desc')->pluck('id');
            $shout->id = intval($last_id)+1;
            return true;
		});
	}
	

	// QUERY SCOPES

	public function scopeSeek($query, $id) {
		return $query->findOrFail($id);
	}

	// zadnjih N shoutov, ki jih user vidi na strani
	public function scopeLatest($query, $quantity) {

		return $query->orderBy('created_at', 'desc')->take($quantity);
	}

	
}
