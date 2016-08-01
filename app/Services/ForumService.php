<?php 
namespace App\Services;


class ForumService {


	protected $post;

	public function __construct($id) {

		$this->post = \App\Post::seek($id);

	}


	public function posts() {
		return $this->user()->posts()->get();
	}
}