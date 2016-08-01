<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use View;

class ForumController extends Controller
{

    public function __construct() {

        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $url = 'http://'.$_SERVER['HTTP_HOST'].'/question2answer/index.php';
        return View::make('forum.index')->with('url', $url);
    }

    public function show($id) {
        $url = \App\Log::find($id)->url;
        return View::make('forum.index')->with('url', $url);
    }

}
