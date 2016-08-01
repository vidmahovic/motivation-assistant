<?php
namespace App\Services;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;

class StatsService {

	protected $user;
	protected $months;

	public function __construct(\App\User $user, Carbon $from) 
	{
		$this->user = $user;
		$this->logs = $this->user->logsActive()->between($from, Carbon::now());
		$this->months = $this->getMonths();
		$this->types = $this->setTypes();
	}

	public function setTypes() {
		return [
			'sum'	   => 0,
			'question' => 0,
			'answer'   => 0,
			'vote' 	   => 0,
			'endorse'  => 0,
		];
	}

	public function getTypes() {
		return $this->types;
	}


	public function mergeWithMonths() 
	{
		$merged = [];
		if(count($this->months)) {
			foreach($this->months as $month)
			{
				$this->transform($this->getLogs($month));
				$merged[$this->charify($month['month'])] = $this->transform($this->getLogs($month));
			}
			$merged['total'] = count($this->months);
		}
		return $merged;
	}

	public function transform(Collection $tasks) {

		$types = $this->types;

		foreach($tasks as $task) {
			$types['sum'] += 1;
			switch($task->type) {
				case "question":
					$types['question'] +=1;
					break;
				case "answer":
					$types['answer'] += 1;
					break;
				case "endorse":
					$types['endorse'] += 1;
					break;
				case "vote":
					$types['vote'] += 1;
					break;
			}
		}
		return $types;
	}

/*	public function toPrecentages() {
		$sum = $this->types['sum']
		foreach(array_except($this->types, 'sum') as $key => $val) {
			if($val != 0) {
				$this->types[$key] = 
			}
		}
	}
*/
	public function getLogs($month) 
	{
		return $this->logs->monthly($month)->get();
	}

	public function getMonths() 
	{
		return $this->logs->months()->get()->toArray();
	}


	private function charify($month)
	{
		return Carbon::createFromDate($month)->format('M');
	}




}