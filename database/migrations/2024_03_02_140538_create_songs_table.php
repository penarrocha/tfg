<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('songs', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->mediumInteger('album_id', 8)->nullable(false)->unsigned();
            $table->foreign('album_id')->references('id')->on('albums')->restrictOnDelete()->cascadeOnUpdate();
            $table->string('song', 64)->nullable(false);
            $table->string('song_clean', 64)->nullable(false);
            $table->char('duration', 7);
            $table->text('lyrics');
            $table->text('description');
            $table->mediumInteger('views', 8)->nullable(false)->unsigned()->default(0);
            $table->unique(['album_id', 'song']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('songs');
    }
};
