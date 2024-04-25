<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void {
        Schema::create('artists', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->string('artist', 64)->unique()->nullable(false);
            $table->string('artist_clean', 64)->unique()->nullable(false);
            $table->string('alias', 64)->unique()->nullable(false);
            $table->string('url', 255);
            $table->text('description');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void {
        Schema::dropIfExists('artists');
    }
};
