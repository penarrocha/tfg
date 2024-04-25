<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('labels', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->string('label', 64)->unique()->nullable(false);
            $table->string('alias', 64)->unique()->nullable(false);
            $table->text('description');
            $table->string('url', 255);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('labels');
    }
};
