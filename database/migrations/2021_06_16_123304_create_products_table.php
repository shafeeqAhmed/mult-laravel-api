<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('sub_title')->nullable();
            $table->foreignId('added_by')
                ->constrained('users');
            $table->text('plid')->nullable()->comment('product list id');
            $table->text('msin')->nullable()->comment('multi junction standerd identification number each variant have unique msin but same plid');
            $table->boolean('is_variant')->default(false);
            $table->foreignId('parent_id')
                ->nullable()
                ->constrained('products');
            $table->float('price')->nullable();
            $table->float('cost')->nullable();
            $table->float('selling_price')->nullable();
            $table->integer('qty')->nullable();
            $table->integer('low_qty_alert')->nullable();
            $table->text('description')->nullable();
            $table->string('color')->nullable();
            $table->float('width')->default(0);
            $table->float('height')->default(0);
            $table->float('length')->default(0);
            $table->float('volumetric_weight')->default(0);
            $table->float('weight')->default(0);
            $table->string('video_provider')->nullable();
            $table->string('video_url')->nullable();
            $table->foreignId('category_id')
                ->nullable()
                ->constrained('categories');
            $table->string('sku')->nullable();
            $table->enum('status',['pending','approved','rejected','disabled'])->default('pending');
            $table->string('slug');
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
        Schema::dropIfExists('products');
    }
}
