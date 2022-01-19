<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBillingAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('billing_addresses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->string('billing_address_recipient_name')->nullable();
            $table->string('billing_address_street_no')->nullable();
            $table->string('billing_address_street_name')->nullable();
            $table->string('billing_address_suburb')->nullable();
            $table->string('billing_address_city')->nullable();
            $table->integer('billing_address_country_id')->default(0);
            $table->integer('billing_address_postal_code')->default(0);
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
        Schema::dropIfExists('billing_addresses');
    }
}
