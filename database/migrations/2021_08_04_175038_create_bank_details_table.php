<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBankDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bank_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
             $table->string('bank_detail_firstname')->nullable();
             $table->string('bank_detail_bank_name')->nullable();
             $table->string('bank_detail_account_no')->nullable();
             $table->string('bank_detail_branch_code')->nullable();
             $table->string('bank_detail_file_name')->nullable();
             $table->enum('bank_detail_request_status', ['Pending', 'Approved','Rejected']);
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
        Schema::dropIfExists('bank_details');
    }
}
