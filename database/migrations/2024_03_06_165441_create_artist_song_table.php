<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void {
        Schema::create('artist_song', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->mediumInteger('artist_id', 8)->nullable(false)->unsigned();
            $table->foreign('artist_id')->references('id')->on('artists')->restrictOnDelete()->cascadeOnUpdate();
            $table->mediumInteger('song_id', 8)->nullable(false)->unsigned();
            $table->foreign('song_id')->references('id')->on('songs')->restrictOnDelete()->cascadeOnUpdate();
            $table->unique(['album_id', 'song_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void {
        Schema::dropIfExists('artist_song');
    }
};
