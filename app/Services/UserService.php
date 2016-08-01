<?php 
namespace App\Services;

class UserService {


	protected $user;

	public function __construct($id) 
	{
		$this->user = \App\User::seek($id);
	}

	public function getUser() {
		return $this->user;
	}


	public function userList($number) 
	{
		return $this->user->pagination($number);
	}

	public function qaLog() {
		return $this->user->posts()->questions()->get();
	}

	public function newPosts($quantity) {
		return $this->user->posts()->new($quantity);
	}

	public function update(array $params) 
	{
		if(! $this->user->update($params)) {
			return false;
		}
		return true;
	}
}