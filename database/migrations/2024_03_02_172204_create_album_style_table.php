<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('album_style', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->mediumInteger('album_id', 8)->nullable(false)->unsigned();
            $table->foreign('album_id')->references('id')->on('albums')->restrictOnDelete()->cascadeOnUpdate();
            $table->smallInteger('style_id', 8)->nullable(false)->unsigned();
            $table->foreign('style_id')->references('id')->on('styles')->restrictOnDelete()->cascadeOnUpdate();
            $table->unique(['album_id', 'style_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('album_style');
    }
};
