<?php


use App\Events\AnswerWasCreated;
use App\Events\QuestionWasCreated;
use App\Events\PostWasVoted;
use Carbon\Carbon;
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('event', function() {

/*	$params = [
		'userid' => 2,
		'postid' => 20,
		'parentid' => null,
		'type' => 'Q',
		'title' => 'Testno vprašanje',
		'content' => 'Testiram vprašanje, ki naj bi nastal notification',
		'url' => 'http://localhost:7777/question2answer/index.php?qa=44&qa_1=kaj-sedaj-sedaj-sedaj',
		'created' => Carbon\Carbon::now()
	];
*/
	echo("Start event");
	Event::fire(new QuestionWasCreated(2, 51));

});

Route::get('client', function() {
	return view('event');
});

Route::post('test', function() {
	return view('test');
});

Route::get('sendmessage', function() {
	return view('layouts.master');
});



Route::get('welcome', function () {
    return view('welcome');
});

Route::resource('hierarchy', 'HierarchyController', ['only' => ['index', 'show']]);


Route::get('/', 'HomeController@index');

Route::post('/', 'HomeController@store');

Route::resource('users', 'UserController', ['except' => 'store', 'create', 'destroy']);

Route::resource('tasks', 'TaskController', ['except' => 'index']);

Route::resource('users.tasks', 'TaskUserController');

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);


Route::get('forum', 'ForumController@index');
Route::get('forum/{id}', 'ForumController@show');

Route::get('socket', 'NotificationController@index');
Route::post('sendmessage', 'NotificationController@store');
Route::get('writemessage', 'NotificationController@render');