<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('album_artist', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->mediumInteger('album_id', 8)->nullable(false)->unsigned();
            $table->foreign('album_id')->references('id')->on('albums')->restrictOnDelete()->cascadeOnUpdate();
            $table->mediumInteger('artist_id', 8)->nullable(false)->unsigned();
            $table->foreign('artist_id')->references('id')->on('bands')->restrictOnDelete()->cascadeOnUpdate();
            $table->smallInteger('relationship_id', 8)->nullable(false)->unsigned();
            $table->foreign('relationship_id')->references('id')->on('relationships')->restrictOnDelete()->cascadeOnUpdate();
            $table->tinyInteger('ordering')->unsigned()->nullable(false)->default(0);
            $table->timestamps();
            $table->unique(['album_id', 'artist_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('album_artist');
    }
};
