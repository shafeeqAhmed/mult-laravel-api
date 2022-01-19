<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWarehouseAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('warehouse_addresses', function (Blueprint $table) {
            $table->id();
             $table->foreignId('user_id');
            $table->string('warehouse_address_recipient_name')->nullable();
            $table->string('warehouse_address_street_no')->nullable();
            $table->string('warehouse_address_street_name')->nullable();
            $table->string('warehouse_address_suburb')->nullable();
            $table->string('warehouse_address_city')->nullable();
            $table->integer('warehouse_address_country_id')->default(0);
            $table->integer('warehouse_address_postal_code')->default(0);
            $table->foreign('user_id')->references('id')->on('users');
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
        Schema::dropIfExists('warehouse_addresses');
    }
}
