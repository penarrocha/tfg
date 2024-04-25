<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up() : void {
        Schema::create('relationships', function (Blueprint $table) {
            $table->mediumIncrements('id');
            $table->string('relationship', 32)->unique();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down() : void {
        Schema::dropIfExists('relationships');
    }
};
