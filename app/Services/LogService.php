<?php 
namespace App\Services;



use Carbon\Carbon;


class LogService {


	protected $user;
	public $log;


	public function __construct(\App\User $user) {

		$this->user = $user;
		$this->log = new \App\Log;
	}


	/**
	 * retrieve upvotes, given TO a user
	 */
	public function passiveUser() 
	{
		return $this->user->logsPassive();
	}

	/**
	 * return upvotes, given BY a user
	 */
	public function activeUser() 
	{
		return  $this->user->logsActive();
	}

	public function getLogs() {
		return $this->log;
	}

	/**
	 * retrieve log records, in which user is the active user
	 * This method only serves for better semantics
	 */
/*	public function upvoted(Carbon $from, Carbon $to)
	{
		return $this->activeUser()->between($from, $to);
	}
*/
	/**
	 * get records from user_log which are new (not yet seen by user)
	 * @return [type] [description]
	 */
	public function newLogs() 
	{
		$unseen = $this->passiveUser()->unseen();

		if(! $unseen->isEmpty()) {
			
			$this->setSeen($unseen);
			return $unseen;
		}
		return null;

	}
	/**
	 * get log history
	 * @return Collection \App\Log
	 */
	public function logHistory(Carbon $from, Carbon $to=null) 
	{
		if(! $to === null) {
			return $this->passiveUser()->between($from, $to)->seen();
		}
		return $this->passiveUser()->between($from, Carbon::now())->seen();
	}

	/**
	 * make unseen records in user_log seen
	 *
	 * @return Object LogService
	 */
	public function setSeen($collection) 
	{
		foreach($collection as $record) {
			$record->ze_videno = 1;
			$record->save();
		}
		return $this;
	}

	public function stringify(array $logs)
	{
		if($logs->count()) {

			foreach($logs as $log) {
				
			}
		}
		return null;
	}


	public function storeAppLog(array $params) {
		
		$this->log->userid_aktiven = intval($params['userid_aktiven']);
		$this->log->userid_pasiven = intval($params['userid_pasiven']);
		$this->log->source = 'app';	
		$this->log->type = $params['type'];
		if(isset($params['id_zadolzitve'])) {
			$this->log->id_zadolzitve = intval($params['id_zadolzitve']);
		}	

		$this->log->save();

	}

	public function storeForumLog(array $params) 
	{	
		$this->log->userid_aktiven = intval($params['userid_aktiven']);
		$this->log->url = $params['url'];

		$this->log->source = 'forum';
		$this->log->postid = intval($params['postid']);
		
		if(! ($params['type'] == 'question')){
			$this->log->userid_pasiven = intval($params['userid_pasiven']);
		}

		$this->log->type = $params['type'];

		$this->log->save();
	}
}