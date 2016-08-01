<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Score extends Model
{
    

    protected $table = 'qa_userpoints';

    protected $primaryKey = 'userid';

    public $timestamps = false;



}
