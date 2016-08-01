<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHierarchiesUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hierarchies_users', function(Blueprint $table) {

            $table->increments('id');

            $table->integer('hierarchy_id')->unsigned();
            $table->integer('user_id')->unsigned();
            $table->integer('parent_user_id')->unsigned();
            $table->timestamps();
        });

        Schema::table('hierarchies_users', function(Blueprint $table) {
            $table->foreign('hierarchy_id')->references('id')->on('hierarchies');
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('parent_user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('hierarchies_users');
    }
}
