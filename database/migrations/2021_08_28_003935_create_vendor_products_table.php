<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendor_products', function (Blueprint $table) {
            $table->id();
            $table->string('msin');

            $table->foreignId('seller_id')->constrained('users');
            $table->foreignId('product_id')->constrained('products');
            $table->string('price')->nullable();
            $table->string('cost')->nullable();
            $table->string('selling_price')->nullalbe();
            $table->string('qty')->nullable();
            $table->string('low_qty_alert')->nullable();

            $table->enum('status',['active', 'inactive'])->default('active');
            $table->enum('list_status', ['pending','approved','rejected','disabled'])->default('pending');


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
        Schema::dropIfExists('vendor_products');
    }
}
