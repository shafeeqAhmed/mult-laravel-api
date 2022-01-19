<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVolumetricTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('volumetric', function (Blueprint $table) {
            $table->id();
			$table->string('min_weight')->nullable();
			$table->string('max_weight')->nullable();
			$table->string('default_price')->nullable();
			$table->string('per_kg_price')->nullable();
			$table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('volumetric');
    }
}
