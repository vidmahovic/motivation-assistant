<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShoutsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('shouts', function(Blueprint $table)
		{
			$table->increments('id');
			$table->text('content');

			$table->integer('user_id')->unsigned();

			$table->timestamps();
		});

		Schema::table('shouts', function(Blueprint $table) {
			$table->foreign('user_id')->references('id')->on('users');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('shouts');
	}

}
