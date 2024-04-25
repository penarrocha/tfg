<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('album_song', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->mediumInteger('album_id', 8)->nullable(false)->unsigned();
            $table->foreign('album_id')->references('id')->on('albums')->restrictOnDelete()->cascadeOnUpdate();
            $table->mediumInteger('song_id', 8)->nullable(false)->unsigned();
            $table->foreign('song_id')->references('id')->on('songs')->restrictOnDelete()->cascadeOnUpdate();
            $table->unique(['album_id', 'song_id']);
            $table->tinyInteger('ordering', 3)->unsigned()->nullable(false)->default(0);
            $table->string('ordering_text', 32)->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('album_song');
    }
};
