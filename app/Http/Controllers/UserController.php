<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Services\UserService;
use App\Services\LogService;
use App\Services\StatsService;
use View;
use Auth;
use Carbon\Carbon;
use Redirect;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Requests\UpdatePasswordRequest;


class UserController extends Controller
{

    public function __construct() 
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $users = new UserService(Auth::user()->userid);
        return View::make('users.index')->with('users', $users->userList(12));
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {

        $user_utils = new UserService($id);
        $user = $user_utils->getUser();
        $logs = $user->logsActive()->between(new Carbon('1 month ago'), Carbon::now())->order('desc');
        $stats = (new StatsService($user, new Carbon('1 year ago')))->mergeWithMonths();

        $tasks = $user->tasks()->order('desc');

        return View::make('users.profile')->with(['user' => $user, 
                                                  'tasks' => $tasks->get(),
                                                  'logs' => $logs->get(),
                                                  'stats' => $stats
                                            ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        if($id != Auth::user()->userid) {
            return Redirect::to('/');
        }
        $user = new UserService($id);
        return View::make('edit')->with('user', $user->getUser());
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(UpdateUserRequest $request)
    { 
        $user = \App\User::seek($request->get('userid'));
        $user->update($request->except(['_token', '_method', 'hidenum']));
        return Redirect::to('users/'.$request->get('userid'));
        
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
