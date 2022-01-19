<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldsSellerRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('seller_requests', function (Blueprint $table) {
            $table->string('seller_standard')->nullable();
            $table->string('seller_website')->nullable();
            $table->string('seller_social_media')->nullable();
            $table->string('seller_monthly_revnue')->nullable();
            $table->string('seller_business_registration_no')->nullable();
            $table->string('seller_business_owner_fname')->nullable();
            $table->string('seller_business_owner_lname')->nullable();
            $table->string('seller_business_owner_email')->nullable();
            $table->string('seller_total_products')->nullable();
            $table->text('seller_product_description')->nullable();
            $table->text('seller_comments')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('seller_requests', function (Blueprint $table) {
            //
        });
    }
}
