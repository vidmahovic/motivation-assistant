<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Position extends Model
{
	// a model to match users with their positions in hierarchy
	


	protected $table = 'hierarchies_users';

	protected $primaryKey = 'id';



    public function scopeSupervisor($query, $user_id) 
    {
    	return $query->find($user_id)->pluck('parent_user_id');
    }
}
