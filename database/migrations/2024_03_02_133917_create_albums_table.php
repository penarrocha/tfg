<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('albums', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->mediumInteger('label_id', 8)->nullable(false)->unsigned();
            $table->foreign('label_id')->references('id')->on('labels')->restrictOnDelete()->cascadeOnUpdate();
            $table->string('album', 64)->nullable(false);
            $table->string('album_clean', 64)->nullable(false);
            $table->string('alias', 64)->nullable(false);
            $table->mediumInteger('views', 8)->nullable(false)->unsigned()->default(0);
            $table->year('released_year');
            $table->date('released_at');
            $table->unique(['label_id', 'album']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('albums');
    }
};
