<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSellerRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seller_requests', function (Blueprint $table) {
            $table->id();
            $table->string('seller_name');
            $table->string('seller_email')->index();
            $table->string('seller_phone_number')->nullable();
            $table->string('seller_mobile_number')->nullable();
            $table->string('seller_company_name')->nullable();
            $table->enum('seller_request_status', ['Pending', 'Rejected', 'Approved']);
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
        Schema::dropIfExists('seller_requests');
    }
}
