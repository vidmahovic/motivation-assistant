<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use DB;

class Log extends Model
{

	protected $table = 'user_log';

	protected $primaryKey = 'id';

	public $timestamps = false;


	protected $dates = ['user_log_timestamp'];



	public function passiveUser() {
		return $this->belongsTo('\App\User', 'userid_pasiven', 'userid');
	}
	public function activeUser() {
		return $this->belongsTo('\App\User', 'userid_aktiven', 'userid');
	}

	public function task() {
		return $this->belongsTo('\App\Task', 'id_zadolzitve', 'id_zadolzitve');
	}
	public function post() {
		return $this->belongsTo('\App\Post', 'postid', 'postid');
	}

	// MUTATORS

	public function setUserLogTimestampAttribute()
	{
	    $this->attributes['user_log_timestamp'] = Carbon::now();
	}

	// SCOPES

	public function scopeBetween($query, Carbon $from, Carbon $to) {
		return $query->where('user_log_timestamp', '>=', $from)
					 ->where('user_log_timestamp', '<', $to);
	}

    public function scopePagination($query, $num) 
    {
       return $query->paginate($num);
    }

	public function scopeOrder($query, $way)
	{
		return $query->orderBy('user_log_timestamp', $way);
	}

	public function scopeUpvoted($query, $id) {
		return $query->where('userid_pasiven', $id);
	}

	public function scopeUpvoter($query, $id) {
		return $query->where('userid_aktiven', $id);
	}

	public function scopeSeen($query) {
		return $query->where('ze_videno', 1);
	}

	public function scopeUnseen($query) {
		return $query->where('ze_videno', 0);
	}

	public function scopeMonthly($query, $month) {
		return $query->where(DB::raw('MONTH(user_log_timestamp)'), '=', $month)->select('*');
	}

	public function scopeMonths($query) {
		//dd($query->select(DB::raw('DISTINCT MONTH(user_log_timestamp) as month'))->groupBy('user_log_timestamp')->get());
		return $query->select(DB::raw('DISTINCT MONTH(user_log_timestamp) AS month'))
                     ->orderBy('user_log_timestamp', 'asc');
	}


}
