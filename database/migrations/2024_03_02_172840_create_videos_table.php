<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('videos', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->enum('provider', ['youtube'])->nullable(false)->default('youtube');
            $table->string('source', 255)->nullable(false);
            $table->string('description', 255);
            $table->mediumInteger('videoable_id', 8)->nullable(false)->unsigned();
            $table->enum('videoable_type', ['album', 'artist', 'band', 'song'])->nullable(false);
            $table->tinyInteger('ordering')->unsigned()->nullable(false)->default(0);
            $table->unique(['videoable_id', 'videoable_type', 'source']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('videos');
    }
};
