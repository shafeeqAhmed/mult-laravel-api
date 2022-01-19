<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_detail', function (Blueprint $table) {
            $table->id();
            $table->foreignId('admin_order_id');
            $table->foreignId('seller_order_id');
            $table->foreignId('seller_id');
            $table->string('item_order_no')->default('100000');
            $table->integer('product_id')->default(0);
            $table->integer('product_qty')->default(0);
            $table->integer('product_amount')->default(0);
            $table->enum('order_status',['In Progress','Dispatched','Completed']);
            $table->foreign('admin_order_id')->references('id')->on('admin_orders');
            $table->foreign('seller_order_id')->references('id')->on('seller_orders');
            $table->foreign('seller_id')->references('id')->on('users');
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
        Schema::dropIfExists('order_detail');
    }
}
