<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdminOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin_orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('customer_id');
            $table->string('unique_no')->nullable();
            $table->string('customer_order_no');
            $table->integer('total_product_amount')->default(0);
            $table->integer('total_product_qty')->default(0);
            $table->enum('order_status',['In Progress','Dispatched','Completed']);
            $table->foreign('customer_id')->references('id')->on('users');
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
        Schema::dropIfExists('admin_orders');
    }
}
