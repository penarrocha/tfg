<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('images', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->string('src', 255)->nullable(false);
            $table->enum('format', ['jpeg', 'webp'])->nullable(false);
            $table->string('description', 255);
            $table->mediumInteger('imageable_id', 8)->nullable(false)->unsigned();
            $table->enum('imageable_type', ['App\Models\Album', 'App\Models\Artist'])->nullable(false);
            $table->tinyInteger('ordering')->unsigned()->nullable(false)->default(0);
            //$table->unique(['imageable_id', 'imageable_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('images');
    }
};
