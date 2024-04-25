<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up() : void
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->mediumInteger('user_id', 8)->nullable(false)->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->restrictOnDelete()->cascadeOnUpdate();
            $table->string('comment', 255)->nullable(false);
            $table->mediumInteger('commentable_id', 8)->nullable(false)->unsigned();
            $table->enum('commentable_type', ['album', 'artist', 'band'])->nullable(false);
            $table->dateTime('date_created')->nullable(false)->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comments');
    }
};
