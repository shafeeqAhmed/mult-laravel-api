<?php

use App\Http\Controllers\HomeController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Requests\EmailVerificationRequest;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/test', function (Request $request) {
    return response()->json($request->all());
});
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {
    Route::post('logout', [\App\Http\Controllers\Api\AuthController::class, 'logout']);
    Route::post('refresh', [\App\Http\Controllers\Api\AuthController::class, 'refresh']);
    Route::get('api/auth/user', [\App\Http\Controllers\Api\AuthController::class, 'userDetail']);

});

Route::post('login', [\App\Http\Controllers\Api\AuthController::class, 'login']);
Route::post('register', [\App\Http\Controllers\Api\AuthController::class, 'register']);
Route::post('email/verification-notification', [\App\Http\Controllers\Api\AuthController::class, 'resendVerificationEmail'])->middleware(['auth:sanctum', 'throttle:6,1']);
Route::post('/email/verify/{id}/{hash}', [\App\Http\Controllers\Api\AuthController::class, 'VerificationEmail']);
Route::post('/forgot-password', [\App\Http\Controllers\Api\AuthController::class, 'forgotPassword']);
Route::post('/reset-password', [\App\Http\Controllers\Api\AuthController::class, 'resetPassword']);
Route::post('/update-profile', [\App\Http\Controllers\Api\UserController::class, 'updateProfile']);
Route::get('user-detail/{id}', [\App\Http\Controllers\Api\UserController::class, 'getUserDetail']);

Route::get('bank-detail/{id}', [\App\Http\Controllers\Api\BankDetailController::class, 'getBankDetail']);
Route::post('/update-bank_detail', [\App\Http\Controllers\Api\BankDetailController::class, 'updateBankDetail']);

Route::get('address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getAddress']);
Route::post('/update-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateAddressDetail']);

Route::get('business-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getBusinessDetail']);

Route::get('billing-address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getBillingAddress']);
Route::post('/update-billing-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateBillingAddressDetail']);

Route::get('warehouse-address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getWarehouseAddress']);
Route::post('/update-warehouse-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateBillingAddressDetail']);
Route::get('billing-address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getBillingAddress']);
Route::post('/update-billing-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateBillingAddressDetail']);

Route::post('/update-profile', [\App\Http\Controllers\Api\UserController::class, 'updateProfile']);
Route::get('user-detail/{id}', [\App\Http\Controllers\Api\UserController::class, 'getUserDetail']);

Route::get('bank-detail/{id}', [\App\Http\Controllers\Api\BankDetailController::class, 'getBankDetail']);
Route::post('/update-bank_detail', [\App\Http\Controllers\Api\BankDetailController::class, 'updateBankDetail']);

Route::get('address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getAddress']);
Route::post('/update-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateAddressDetail']);

Route::get('business-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getBusinessDetail']);

Route::get('billing-address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getBillingAddress']);
Route::post('/update-billing-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateBillingAddressDetail']);



Route::get('warehouse-address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class,'getWarehouseAddress']);
Route::post('/update-warehouse-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateWarehouseAddressDetail']);
Route::get('out-office-detail/{id}', [\App\Http\Controllers\Api\BankDetailController::class,'getOutOfficeDates']);
Route::post('/update-out-office-detail', [\App\Http\Controllers\Api\BankDetailController::class, 'updateOutOfficeDetail']);


Route::post('/update-profile', [\App\Http\Controllers\Api\UserController::class, 'updateProfile']);
Route::get('user-detail/{id}', [\App\Http\Controllers\Api\UserController::class, 'getUserDetail']);

Route::get('bank-detail/{id}', [\App\Http\Controllers\Api\BankDetailController::class, 'getBankDetail']);
Route::post('/update-bank_detail', [\App\Http\Controllers\Api\BankDetailController::class, 'updateBankDetail']);

Route::get('address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getAddress']);
Route::post('/update-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateAddressDetail']);

Route::get('business-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getBusinessDetail']);

Route::get('billing-address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getBillingAddress']);
Route::post('/update-billing-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateBillingAddressDetail']);

Route::get('warehouse-address-detail/{id}', [\App\Http\Controllers\Api\AddressesController::class, 'getWarehouseAddress']);
Route::post('/update-warehouse-address', [\App\Http\Controllers\Api\AddressesController::class, 'updateWarehouseAddressDetail']);
Route::get('out-office-detail/{id}', [\App\Http\Controllers\Api\BankDetailController::class, 'getOutOfficeDates']);

Route::post('/update-out-office-detail', [\App\Http\Controllers\Api\BankDetailController::class, 'updateOutOfficeDetail']);


Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {

    Route::get('customer/categories', [\App\Http\Controllers\Api\CategoryController::class, 'index']);

    Route::post('customer/order', [\App\Http\Controllers\Api\OrdersController::class, 'storeOrder']);

    Route::get('seller/transactions', [\App\Http\Controllers\Api\OrdersController::class, 'getSellerTransactions']);

    Route::get('seller/inventory_products', [\App\Http\Controllers\Api\ProductController::class, 'getSellerInventoryProducts']);

   Route::get('seller/detail', [\App\Http\Controllers\Api\UserController::class, 'getSellerDetail']);
    Route::get('seller/permission', [\App\Http\Controllers\Api\UserController::class, 'getSellerPermission']);

    Route::resource('categories', \App\Http\Controllers\Api\CategoryController::class);
    Route::get('sub-category', [\App\Http\Controllers\Api\CategoryController::class, 'SubCategory']);
    Route::get('category-child/{category}', [\App\Http\Controllers\Api\CategoryController::class, 'CategoryChilds']);
    Route::get('category-breadcrum-search/{keyword}/{categoryId}', [\App\Http\Controllers\Api\CategoryController::class, 'CategoryBreadCrumSearchCustomFields']);
    Route::get('category-breadcrum-search-attribute/{keyword}/{attributeId}', [\App\Http\Controllers\Api\CategoryController::class, 'CategoryBreadCrumSearchAttributes']);
    Route::get('category/{all}/record', [\App\Http\Controllers\Api\CategoryController::class, 'all']);
    Route::get('category/{category}/field', [\App\Http\Controllers\Api\CategoryController::class, 'categoryCustomFields']);
    Route::get('category/{category}/attributes', [\App\Http\Controllers\Api\CategoryController::class, 'categoryAttributes']);

    Route::resource('fields', \App\Http\Controllers\Api\CustomFieldsController::class);
    Route::post('fields/assign-to-category', [\App\Http\Controllers\Api\CustomFieldsController::class, 'assignCustomFieldToCategory']);
    Route::get('fields/{category}/category', [\App\Http\Controllers\Api\CustomFieldsController::class, 'fetchCategoryCustomFields']);
    Route::post('fields/store', [\App\Http\Controllers\Api\CustomFieldsController::class, 'storeProductCustomFields']);
    // product route
    Route::resource('products', \App\Http\Controllers\Api\ProductController::class);
    Route::post('products/update-dimention', [\App\Http\Controllers\Api\ProductController::class, 'updateProductDimention']);

    Route::post('seller/update-inventory', [\App\Http\Controllers\Api\ProductController::class, 'updateProductInventory']);
    Route::post('products/update-description', [\App\Http\Controllers\Api\ProductController::class, 'updateProductDescription']);


    Route::post('products/update-video', [\App\Http\Controllers\Api\ProductController::class, 'updateProductVideo']);
    Route::post('products/update-product-images', [\App\Http\Controllers\Api\ProductController::class, 'updateProductImages']);
    Route::post('products/update-custom-field', [\App\Http\Controllers\Api\ProductController::class, 'updateProductCustomField']);
    Route::post('products/make-combination', [\App\Http\Controllers\Api\ProductController::class, 'makeCombination']);
    Route::post('products/variant', [\App\Http\Controllers\Api\ProductController::class, 'storeProductVariant']);

    Route::post('vendor_products', [\App\Http\Controllers\Api\ProductController::class, 'storeVendorProduct']);

    // attributes
    Route::resource('attributes', \App\Http\Controllers\Api\AttributeController::class);
    Route::resource('seller_requests', \App\Http\Controllers\Api\SellerRequestController::class);
    Route::post('attribute/assign-to-category', [\App\Http\Controllers\Api\AttributeController::class, 'assignAttributeToCategory']);
    Route::post('seller_request/change_status', [\App\Http\Controllers\Api\SellerRequestController::class, 'changeStatus']);

    Route::post('vendor_product/change_list_status', [\App\Http\Controllers\Api\VendorProductsController::class, 'changeListStatus']);

     Route::post('seller_product/change_status', [\App\Http\Controllers\Api\VendorProductsController::class, 'changeSellerProductStatus']);

    ///Users
    Route::get('users/all', [\App\Http\Controllers\Api\UserController::class, 'index']);
    Route::get('users/delete/{id?}', [\App\Http\Controllers\Api\UserController::class, 'deleteUser']);
    Route::post('users/add-user', [\App\Http\Controllers\Api\UserController::class, 'adduser']);
    Route::get('user/fetch/{id?}', [\App\Http\Controllers\Api\UserController::class, 'fetchuser']);
    Route::post('user/update/{id?}', [\App\Http\Controllers\Api\UserController::class, 'updateuser']);
    Route::get('users/search/{search?}', [\App\Http\Controllers\Api\UserController::class, 'searchuser']);
});


//admin routes
Route::group(['prefix' => 'admin', 'middleware' => ['auth:sanctum', 'verified']], function () {
    Route::get('users', [\App\Http\Controllers\Api\UserController::class, 'getUsers']);
    Route::post('users/seller-product-permission', [\App\Http\Controllers\Api\UserController::class, 'sellerProductPermission']);
    Route::post('users/seller-product-reselling-permission', [\App\Http\Controllers\Api\UserController::class, 'sellerProductReselling']);
     Route::post('users/seller-product-on-hold-permission', [\App\Http\Controllers\Api\UserController::class, 'sellerProductHoldPermission']);
    Route::get('product-seller', [\App\Http\Controllers\Api\ProductController::class, 'productSeller']);
    Route::get('order', [\App\Http\Controllers\Api\OrdersController::class, 'index']);
    Route::get('order-detail/{orderNo}', [\App\Http\Controllers\Api\OrdersController::class, 'adminOrderDetail']);


    Route::post('order/statusChange', [\App\Http\Controllers\Api\OrdersController::class, 'productStatusChange']);

    Route::get('vendor/products', [\App\Http\Controllers\Api\VendorProductsController::class, 'index']);
 Route::post('products/vendor-product-status', [\App\Http\Controllers\Api\VendorProductsController::class, 'vendorProductStatus']);
    // website setup routes
        Route::post('website/{header}', [\App\Http\Controllers\Api\BusinessSettingController::class, 'websiteSetupSettings']);
        Route::get('website/{header}', [\App\Http\Controllers\Api\BusinessSettingController::class, 'getWebsiteSetupSettings']);
});

Route::group(['prefix' => 'seller', 'middleware' => ['auth:sanctum', 'verified']], function () {
    Route::get('order', [\App\Http\Controllers\Api\OrdersController::class, 'sellerOrder']);
    Route::get('orders', [\App\Http\Controllers\Api\OrdersController::class, 'sellerOrders']);
    Route::get('existing-product', [\App\Http\Controllers\Api\ProductController::class, 'existingProduct']);
    Route::post('vendorProduct', [\App\Http\Controllers\Api\ProductController::class, 'store']);

});

 Route::get('customer/website/{header}', [\App\Http\Controllers\Api\BusinessSettingController::class, 'getWebsiteSetupSettings']);
 Route::get('customer/fetchCartProducts/{ids}', [\App\Http\Controllers\Api\ProductController::class, 'getCartProducts']);
 Route::get('customer/email-is-verified', [\App\Http\Controllers\Api\AuthController::class, 'isVerifiedEmail'])->middleware('auth:sanctum');
 Route::get('customer/fetchBlogCategories', [\App\Http\Controllers\Api\CategoryController::class, 'getBlogCategories']);


//pages routes

Route::get('pages/fetchRecords', [\App\Http\Controllers\Api\PagesController::class, 'index']);
Route::get('page/fetchRecord/{id?}', [\App\Http\Controllers\Api\PagesController::class, 'edit']);
Route::post('page/add', [\App\Http\Controllers\Api\PagesController::class, 'create']);
Route::post('page/update-page-2/{id?}', [\App\Http\Controllers\Api\PagesController::class, 'update']);

///Blogs routes
Route::get('blogs/fetchRecords', [\App\Http\Controllers\Api\BlogController::class, 'index']);
Route::post('blog/add', [\App\Http\Controllers\Api\BlogController::class, 'create']);
Route::get('blogs/fetchRecord/{id?}', [\App\Http\Controllers\Api\BlogController::class, 'edit']);
Route::post('blogs/update/{id?}', [\App\Http\Controllers\Api\BlogController::class, 'update']);
///Blog Category
Route::get('Bcategory/fetchRecords', [\App\Http\Controllers\Api\BlogController::class, 'blog_category']);
Route::post('blog_category/add', [\App\Http\Controllers\Api\BlogController::class, 'Bcategory_create']);
Route::get('Bcategory/fetchRecord/{id?}', [\App\Http\Controllers\Api\BlogController::class, 'Bcategory_edit']);
Route::post('Bcategory/update/{id?}', [\App\Http\Controllers\Api\BlogController::class, 'Bcategory_update']);

Route::get('Customer/Cblogs/{id}', [\App\Http\Controllers\Api\BlogController::class, 'getCategoryBlogs']);

//flashdeals
Route::get('flashdeals/fetchRecords', [\App\Http\Controllers\Api\FlashDealsController::class, 'index']);
Route::get('flashdeal/fetchproducts', [\App\Http\Controllers\Api\FlashDealsController::class, 'fetchproducts']);
Route::post('flashdeal/update_status', [\App\Http\Controllers\Api\FlashDealsController::class, 'update_status']);
Route::post('flashdeal/update_featured', [\App\Http\Controllers\Api\FlashDealsController::class, 'update_featured']);
Route::post('flashdeal/update/{id}', [\App\Http\Controllers\Api\FlashDealsController::class, 'update']);
Route::resource('flashdeal', \App\Http\Controllers\Api\FlashDealsController::class, [
    'only' => ['destroy','create','store','edit']
]);
Route::post('products/fetchDetail', [\App\Http\Controllers\Api\FlashDealsController::class, 'productDetail']);
Route::post('page/update/{id?}', [\App\Http\Controllers\Api\PagesController::class, 'update']);




// customer categories

Route::post('store-seller-request', [\App\Http\Controllers\Api\SellerRequestController::class, 'storeSellerRequest']);
Route::get('customer-parent-categories', [\App\Http\Controllers\Api\CategoryController::class, 'getCategories']);
Route::get('apperance-category', [\App\Http\Controllers\Api\CategoryController::class, 'getAppearanceCategory']);
Route::get('category-products/{slug}', [\App\Http\Controllers\Api\CategoryController::class, 'getCategoryProducts']);

Route::get('product-detail/{plid}', [\App\Http\Controllers\Api\ProductController::class, 'getProductDetail']);
Route::post('products/get-product-variant', [\App\Http\Controllers\Api\ProductController::class, 'getProductVariant']);


 Route::get('product/detail/{id}', [\App\Http\Controllers\Api\ProductController::class, 'getProductRecord']);


// Marketing Routes

Route::get('subscribers/fetchRecords', [\App\Http\Controllers\Api\SubscribersController::class, 'index']);
Route::resource('subscriber', \App\Http\Controllers\Api\SubscribersController::class);
Route::get('marketing/subscribers-fetchRecords', [\App\Http\Controllers\Api\SubscribersController::class, 'fetchsubscribers']);
Route::get('marketing/users-fetchRecords', [\App\Http\Controllers\Api\UserController::class, 'fetchusers']);
Route::post('newsletters/newsletter-email', [\App\Http\Controllers\Api\SubscribersController::class, 'newsletter_email']);


//Setup & Configurations
Route::get('shipping/volumetric', [\App\Http\Controllers\Api\ShippingController::class, 'volumetric']);
Route::get('volumatric/fetchRecord/{id}', [\App\Http\Controllers\Api\ShippingController::class, 'volumetric_edit']);
Route::post('volumatric/update/{id}', [\App\Http\Controllers\Api\ShippingController::class, 'volumetric_update']);

//SMTP
Route::get('smtp/smtp-fetchRecords', [\App\Http\Controllers\Api\ConfigurationsController::class, 'smpt_fetch']);
Route::get('social-media-login/fetchRecords', [\App\Http\Controllers\Api\ConfigurationsController::class, 'social_media_login']);
Route::get('recaptcha/fetchRecords', [\App\Http\Controllers\Api\ConfigurationsController::class, 'fetch_recaptcha']);
Route::get('setting/fetchRecords', [\App\Http\Controllers\Api\ConfigurationsController::class, 'fetch_setting']);
Route::post('smtp/smtp-update', [\App\Http\Controllers\Api\ConfigurationsController::class, 'smpt_update']);
Route::post('smtp/send_email', [\App\Http\Controllers\Api\ConfigurationsController::class, 'send_email']);
Route::post('social_media_login/google-login-update', [\App\Http\Controllers\Api\ConfigurationsController::class, 'google_login_update']);
Route::post('social_media_login/facebook-login-update', [\App\Http\Controllers\Api\ConfigurationsController::class, 'facebook_login_update']);
Route::post('social_media_login/twitter-login-update', [\App\Http\Controllers\Api\ConfigurationsController::class, 'twitter_login_update']);
Route::post('recaptcha/v2-update', [\App\Http\Controllers\Api\ConfigurationsController::class, 'google_recaptcha_update']);
Route::post('recaptcha/v3-update', [\App\Http\Controllers\Api\ConfigurationsController::class, 'google_recaptcha_v3_update']);
Route::post('setting/update', [\App\Http\Controllers\Api\ConfigurationsController::class, 'setting_update']);
