<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUpvotesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('upvotes', function(Blueprint $table)
		{
		    $table->increments('id');
		    $table->integer('upvoter_id')->unsigned();
		    $table->integer('upvoted_id')->unsigned();
		    $table->integer('task_id')->unsigned();
		    $table->timestamps();
		    $table->softDeletes();
		});


		Schema::table('upvotes', function(Blueprint $table)
		{
			$table->foreign('upvoter_id')->references('id')->on('users')->onDelete('cascade');
			$table->foreign('upvoted_id')->references('id')->on('users')->onDelete('cascade');
			$table->foreign('task_id')->references('id')->on('tasks')->onDelete('cascade');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('upvotes');
	}

}
