<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;



return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('styles', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->string('style', 32)->unique()->nullable(false);
            $table->string('alias', 32)->unique()->nullable(false);
            $table->text('description');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('styles');
    }
};
