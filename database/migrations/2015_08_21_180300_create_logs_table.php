<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('logs', function(Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            //$table->integer('post_id')->unsigned();
            $table->boolean('seen')->default(false);
        });

        Schema::table('logs', function(Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users');
            //$table->foreign('post_id')->references('id')->on('posts');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('logs');
    }
}
