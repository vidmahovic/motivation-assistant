<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Services\HierarchyService;


use Redirect;
use View;

class HierarchyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $hierarchy = new HierarchyService(20);

        return View::make('hierarchy')->with('hierarchy', $hierarchy->build());
        
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {

        if($id == 20) {
            return Redirect::to('hierarchy');
        }

        $hierarchy = new HierarchyService($id);

        return View::make('hierarchy')->with('hierarchy', $hierarchy->build());
    }

}
