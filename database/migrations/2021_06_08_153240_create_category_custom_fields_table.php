<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoryCustomFieldsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('category_custom_fields', function (Blueprint $table) {
            $table->id();
            $table->foreignId('custom_field_id')
                ->constrained('custom_fields');
            $table->foreignId('category_id')
                ->constrained('categories');
            $table->integer('order_level')->default(0);
            $table->foreignId('user_id')
                ->nullable()
                ->constrained('users');
            $table->boolean('status')->default(true);
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
        Schema::dropIfExists('category_custom_fields');
    }
}
