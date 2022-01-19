<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('transistion_type_id');
            $table->foreignId('admin_order_id');
            $table->foreignId('seller_order_id');
            $table->foreignId('order_detail_id');
            $table->foreignId('user_id');
            
            $table->string('transaction_no')->default('100000');
            $table->string('transaction_description')->nullable(true);
            $table->integer('order_amount')->default(0);
            $table->string('comission_paid')->nullable();
            $table->integer('qty')->default(0);
            $table->string('available_balance')->default(0);
            $table->string('current_balance')->default(0);
            $table->enum('user_type',['customer','seller','admin']);
            $table->enum('transaction_type',['Completed','Dispatched','In Progress']);

            $table->foreign('transistion_type_id')->references('id')->on('transaction_types');
            $table->foreign('admin_order_id')->references('id')->on('admin_orders');
            $table->foreign('seller_order_id')->references('id')->on('seller_orders');
            $table->foreign('order_detail_id')->references('id')->on('order_detail');
            $table->foreign('user_id')->references('id')->on('users');
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
        Schema::dropIfExists('transactions');
    }
}
