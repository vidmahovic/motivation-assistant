<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
	 	Schema::create('users', function(Blueprint $table) {

	 		$table->increments('id');
	 		$table->string('email')->unique();
	 		$table->string('name');
	 		$table->string('surname');
	 		$table->date('birth_date');
	 		$table->string('title')->nullable();
	 		$table->string('education')->nullable();
	 		$table->string('phone');
	 		$table->string('password');

	 		$table->timestamps();
	 		$table->softDeletes();
	 		$table->rememberToken();

	 	});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('users');
	}

}
