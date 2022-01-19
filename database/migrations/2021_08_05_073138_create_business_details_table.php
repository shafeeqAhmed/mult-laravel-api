<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBusinessDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('business_details', function (Blueprint $table) {
           $table->bigIncrements('business_id');
            $table->foreignId('user_id');
            $table->string('business_legal_name')->nullable();
            $table->string('business_type')->nullable();
            $table->string('business_registration_number')->nullable();
            $table->string('business_account_file')->nullable();
            $table->string('business_id_document')->nullable();
            $table->string('business_bee_status')->nullable();
            $table->date('business_out_office_from');
             $table->date('business_out_office_to');
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
        Schema::dropIfExists('business_details');
    }
}
