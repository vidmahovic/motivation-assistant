<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Redirect;
use Auth;
use User;
use Carbon\Carbon;
use View;


class HomeController extends Controller
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
        $user = Auth::user();

        $new_logs = $user->logsPassive()->unseen()->order('desc')->get();
        $logs = $user->logsPassive()->between(new Carbon('1 month ago'), Carbon::now())->seen()->order('desc')->pagination(20);
        foreach($new_logs as $log) {
            $log->ze_videno = 1;
            $log->save();
        }

        return View::make('home')->with(['new_logs' => $new_logs, 'logs' => $logs]);
    }

    /**
     * Store a newly created shoutbox comment (shoutbox is a part of home page)
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $shout = new \App\Shout;
        $shout->content = $request['content'];
        Auth::user()->shouts()->save($shout);

        return Redirect::back();
    }




    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
