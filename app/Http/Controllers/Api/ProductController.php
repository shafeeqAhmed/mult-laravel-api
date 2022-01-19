<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductCategoryCustomFields;
use App\Models\ProductImages;
use App\Models\Products;
use App\Models\ProductVariantAttribute;
use Illuminate\Http\Request;
use Exception;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\VendorProduct;

use function BenTools\CartesianProduct\cartesian_product;

class ProductController extends Controller
{
    private $plid = 10000;
    private $msin = 10000;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $data['admin_products'] = Products::with(['images' => function ($query) {
                $query->where('is_primary', 1);
            }])->when($request->q, function ($query, $q) {
                return $query->where('title', 'LIKE', "%{$q}%")->orWhere('sku', 'LIKE', "%{$q}%")->orWhere('price', 'LIKE', "%{$q}%")
                    ->orWhere('qty', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->paginate($request->perPage);

            return response()->json(['status' => true, 'message' => 'Products have been collected successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function productSeller(Request $request)
    {
        // try {
        $users = User::join('model_has_roles as mhr', 'mhr.model_id', '=', 'users.id')
            ->join('roles', 'roles.id', '=', 'mhr.role_id')
            ->where('roles.name', 'seller')
            ->pluck('users.id');
        $data['admin_products'] = Products::with(['variants', 'images' => function ($query) {
            $query->where('is_primary', 1);
        }])->when($request->q, function ($query, $q) {
            return $query->where('title', 'LIKE', "%{$q}%")->orWhere('sku', 'LIKE', "%{$q}%")->orWhere('price', 'LIKE', "%{$q}%")
                ->orWhere('qty', 'LIKE', "%{$q}%");
        })
            ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                return $query->orderBy($sortBy, $request->sortDesc);
            })
            ->join('users as u', 'u.id', '=', 'products.added_by')
            ->join('categories as c', 'c.id', '=', 'products.category_id')
            ->whereIn('added_by', $users)
            ->where('is_variant', 0)
            ->select('products.id', 'products.title', 'u.name as seller_name', 'products.created_at', 'products.status', 'c.name as category_name', 'c.commission_rate')

            //////////////////

            /* ->join('vendor_products as pv', 'pv.product_id','=','products.id')
                ->join('users as u', 'u.id','=','pv.seller_id')
                ->join('categories as c', 'c.id', '=', 'products.category_id')
                ->whereIn('pv.seller_id', $users)
                ->where('is_variant', 0)
                ->select('pv.id', 'products.title','u.name as seller_name','pv.created_at', 'pv.list_status as status','c.name as category_name', 'c.commission_rate')*/
            //////////////////

            ->paginate($request->perPage);

        return response()->json(['status' => true, 'message' => 'Products have been collected successfully', 'data' => $data]);
        // } catch (Exception $e) {

        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


        // try {
            $validatedData1 = $request->validate([
                'title' => ['required', 'max:50', Rule::unique('products')->ignore($request->product_id)],
                'sub_title' => ['nullable'],
                'price' => ['nullable'],
                'cost' => ['nullable'],
                'selling_price' => ['nullable'],
                'qty' => ['nullable'],
                'low_qty_alert' => ['nullable'],
            ]);

            $validatedData = collect($validatedData1)->only('title', 'sub_title');

            $validatedData['added_by'] = $request->user()->id;
            $isAdmin = DB::table('model_has_roles')->where('role_id', 1)
                ->where('model_id', $request->user()->id)
                ->exists();
            $validatedData['status'] = $request->user()->product_auto_approved == 1 || $isAdmin ? 'approved' : 'pending';
            $validatedData['slug'] = Str::slug($request->title, '-');
            $this->getPlid();
              $sku=str_replace(' ','-', $validatedData['title']);
            $validatedData['sku'] = $sku;

            if ($request->product_id == 0) {

                $validatedData['plid'] = $this->plid;
                $record = Products::create($validatedData->toArray());
                $data['product'] = $record;
                $this->plid++;

                $product_id  = $record->id;
                $seller_id   = $request->user()->id;
                $this->getMsin();
                $vendor_record['msin'] =  $this->msin;
                $vendor_record['seller_id'] = $seller_id;
                $vendor_record['product_id'] =  $product_id;
                $vendor_record['sku'] =   $sku;
                $vendor_record['price'] = $request->user()->product_auto_approved  == 1  ? $validatedData1['price'] : 0;
                $vendor_record['cost'] =  $request->user()->product_auto_approved== 1  ? $validatedData1['cost'] : 0;
                $vendor_record['selling_price'] =  $request->user()->product_auto_approved == 1  ? $validatedData1['selling_price'] : 0;
                $vendor_record['qty'] =  $request->user()->product_auto_approved == 1  ? $validatedData1['qty'] : 0;
                $vendor_record['low_qty_alert'] =    $request->user()->product_auto_approved == 1  ? $validatedData1['low_qty_alert'] : 0;
                $vendor_record['list_status'] = $request->user()->product_auto_approved == 1 || $isAdmin ? 'approved' : 'pending';
                $vendor_record['status'] = $request->user()->product_auto_approved == 1 || $isAdmin ? 'active' : 'inactive';
                VendorProduct::create($vendor_record);
                $this->msin++;

                $message = "Product has been added successfully";
            } else {
                $updateRecord['title'] = $validatedData['title'];
                $updateRecord['sub_title'] = $validatedData['sub_title'];
                $updateRecord['slug'] = $validatedData['slug'];
                Products::where('id', $request->product_id)->update($updateRecord);
                $data['product'] = Products::where('id', $request->product_id)->first();
                $message = "Product has been update successfully";
            }
            return response()->json(['status' => true, 'message' => $message, 'data' => $data]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }


    public function storeVendorProduct(Request $request)
    {

        try {
            $validatedData = $request->validate([
                'product_id' => ['required'],
                'price' => ['required'],
                'cost' => ['required'],
                'selling_price' => ['required'],
                'qty' => ['required'],
                'low_qty_alert' => ['required'],
            ]);

            $validatedData['status'] = 'active';
            $validatedData['list_status'] = 'pending';
            $this->getMsin();

            $validatedData['msin'] = $this->msin;
            $validatedData['seller_id'] = $request->user()->id;
            $data['product'] = VendorProduct::create($validatedData);
            $this->msin++;

            $message = "Product has been added successfully";

            return response()->json(['status' => true, 'message' => $message, 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function getPlid()
    {
        $lastRecord = Products::orderBy('plid', 'desc')->first();
        if ($lastRecord) {
            $this->plid = $lastRecord->plid ? (++$lastRecord->plid) : 10000;
        }
        $this->plid;
    }

    public function getMsin()
    {
        $lastRecord = VendorProduct::orderBy('msin','desc')->first();
        if ($lastRecord) {
            $this->msin = $lastRecord->msin ? (++$lastRecord->msin) : 10000;
        }
        $this->msin;
    }
    public function updateProductImages(Request $request)
    {
        try {
            $request->validate([
                'product_id' => ['required'],
                'primary' => ['nullable', 'image'],
                'file1' => ['nullable', 'image'],
                'file2' => ['nullable', 'image'],
                'file3' => ['nullable', 'image'],
                'file4' => ['nullable', 'image'],
            ]);
            $images = [];

            foreach ($request->all() as $key => $value) {
                $tmp = array();

                if ($request->hasFile($key)) {
                    $product_image = ProductImages::where('product_id', $request->product_id)->where('type', $key)->first();
                    if ($product_image) {
                        removeImage('product', $product_image->url);
                    }
                    ProductImages::where('product_id', $request->product_id)->where('type', $key)->delete();
                    $tmp['product_id'] = $request->product_id;
                    $tmp['url'] = uploadImage($key, 'product', 400, 400);
                    $tmp['is_primary'] = $key == 'primary' ? 1 : 0;
                    $tmp['created_at'] = Carbon::now();
                    $tmp['type'] = $key;
                    $images[] = $tmp;
                }
            }

            ProductImages::insert($images);
            return response()->json(['status' => true, 'message' => 'Product Images has been added successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function updateProductDimention(Request $request)
    {
        try {
            $request->validate([
                'product_id' => ['required'],
                'width' => ['nullable'],
                'height' => ['nullable'],
                'length' => ['nullable'],
                'volumetric_weight' => ['nullable'],
                'weight' => ['nullable'],
            ]);
            products::where('id', $request->product_id)->update($request->except('product_id'));
            return response()->json(['status' => true, 'message' => 'Product Dimention has been updated successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


     public function updateProductDescription(Request $request)
    {
        try {
            $request->validate([
                'product_id' => ['required'],
                'short_description' => ['nullable'],
                'long_description' => ['nullable'],
            ]);
            products::where('id', $request->product_id)->update($request->except('product_id'));
            return response()->json(['status' => true, 'message' => 'Product Description has been updated successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function updateProductInventory(Request $request)
    {
        try {
            $request->validate([
                'id' => ['required'],
                'value' => ['required'],
                'type' => ['required'],
            ]);

            VendorProduct::where('id', $request->id)->update([$request->type => $request->value]);

            return response()->json(['status' => true, 'message' => 'Inventory has been updated successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function updateProductVideo(Request $request)
    {
        try {
            $request->validate([
                'product_id' => ['required'],
                'video_provider' => ['nullable'],
                'video_url' => ['nullable', 'url'],
            ]);
            products::where('id', $request->product_id)->update($request->except('product_id'));
            return response()->json(['status' => true, 'message' => 'Product Video has been updated successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function updateProductCustomField(Request $request)
    {
        try {
            $request->validate([
                'product_id' => ['required', 'numeric'],
                'category_id' => ['required', 'numeric']
            ]);

            $fields = json_decode($request->fields);
            foreach ($fields->fields as $key => $field) {
                if ($field->type == 'file') {
                    foreach ($field->select as $key2 => $file) {
                        $field->select[$key2] = customFieldUploadImage($file, 'customFields', 400, 400);
                    }
                }
            }

            // if product sore first time then get id form inserted record otherwise get id from request
            $recordField['product_id'] = $request->product_id;
            $recordField['category_custom_field_id'] = $fields->id;
            $recordField['fields'] = json_encode($fields);

            DB::transaction(function () use ($recordField, $request) {
                //insert category in product table
                Products::where('id', $request->product_id)->update(['category_id' => $request->category_id]);
                //insert record in custom fields
                ProductCategoryCustomFields::create($recordField);
            });
            return response()->json(['status' => true, 'message' => 'Product Custom Fields and Category has been updated successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function makeCombination(Request $request)
    {
        try {
            $data['combinations'] = cartesian_product($request->all())->asArray();
            return response()->json(['status' => true, 'message' => 'Combinations has been generated successfully', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    //  $oldFile = BusinessSetting::where('type', $key)->value('value');
    //         removeImage('admin/website', $oldFile);
    private function createProductObject($product, $validated, $request, $status, $status_vendor)
    {
        $arr = [];
        $arr['is_variant'] = 1;
        $arr['title'] = $product['title'];
        $arr['parent_id'] = $validated['product_id'];
        $arr['category_id'] = $validated['category_id'];
        $arr['added_by'] = $request->user()->id;
        $arr['color'] = $product['color'];
        $arr['qty'] = $product['qty'];
        $arr['sku'] = $product['sku'];
        $arr['status'] = $status;
        $arr['status_vendor'] = $status_vendor;
        $arr['variant_attribute'] = $product['variant_attribute'];
        $arr['slug'] = Str::slug($product['title'], '-');
        return $arr;
    }
    public function storeProductVariant(Request $request)
    {

        // try {

        $validated = $request->validate([
            'product_id' => ['required', 'numeric', 'gt:0'],
            'category_id' => ['required', 'numeric', 'gt:0'],
        ]);
        $this->getPlid();
        $oldProduct = Products::where('is_variant', 1)->where('parent_id', $validated['product_id'])->get();
        $images = $request->images;
        foreach ($images as &$file) {
            $file['image'] = customFieldUploadImage($file['image'], 'product', '400', '400');
        }

        $images = collect($images);
        $products = $request->products;


        if (request('attributes')) {
            //update or create  product variant attributes
            $this->updateVariants($images);
        }
        //update product status
        $isAdmin = DB::table('model_has_roles')->where('role_id', 1)
            ->where('model_id', $request->user()->id)
            ->exists();
        $status = $request->user()->product_auto_approved == 1 || $isAdmin ? 'approved' : 'pending';

        $status_vendor = $request->user()->product_auto_approved == 1 || $isAdmin ? 'active' : 'inactive';


        $this->getPlid();
        $this->getMsin();

        if (count($oldProduct) === 0) {
            foreach ($products as $product) {
                $variantProduct = $product;
                $product = $this->createProductObject($product, $validated, $request, $status, $status_vendor);

                DB::transaction(function () use ($product, $images, $variantProduct) {
                    $product['plid'] = $this->plid;
                    //insert category in product table

                    $productVendor['msin'] = $this->msin;
                    $productVendor['seller_id'] = $product['added_by'];
                    $productVendor['selling_price'] = $variantProduct['selling_price'];
                    $productVendor['qty'] = $product['qty'];
                    $productVendor['list_status'] = $product['status'];
                    $productVendor['status'] = $product['status_vendor'];
                    $productVendor['sku'] = $product['sku'];
                    $productVendor['cost'] = isset($product['cost']) ? $product['cost'] : 0;
                    // $productVendor['selling_price'] = isset($product['selling_price']) ? $product['selling_price'] : 0;
                    $productVendor['low_qty_alert'] = isset($product['low_qty_alert']) ? $product['low_qty_alert'] : 0;

                    $record = Products::create(collect($product)->except('status_vendor')->toArray());
                    $productVendor['product_id'] = $record->id;
                    VendorProduct::create($productVendor);

                    $this->plid++;
                    $this->msin++;
                    $productImage['product_id'] = $record->id;
                    $productImage['is_primary'] = true;
                    $productImage['url'] = $images->where('color', $product['color'])->first()['image'];
                    //insert record into product images table
                    ProductImages::create($productImage);
                });
            }
        } else {
            foreach ($products as $product) {
                $product = $this->createProductObject($product, $validated, $request, $status, $status_vendor);
                //if product variant already exist
                $isExist = $oldProduct->where('parent_id', $product['parent_id'])
                    ->where('is_variant', true)
                    ->where('title', $product['title'])
                    ->first();
                // return response()->json([$isExist->update($product), $isExist]);
                if ($isExist) {
                    DB::transaction(function () use ($product, $images, $isExist) {
                        //update the product record
                        $isExist->update($product);
                        $productImage['product_id'] = $isExist->id;
                        $productImage['is_primary'] = true;
                        $productImage['url'] = $images->where('color', $product['color'])->first()['image'];

                        //insert record into product images table
                        $productImageRecord = ProductImages::where('product_id', $productImage['product_id'])
                            ->where('is_primary', true)->first();
                        removeImage('product', $productImageRecord->url);

                        $productImageRecord->update($productImage);
                        // remove image from the directory
                    });
                } else {
                    DB::transaction(function () use ($product, $images) {
                        $product['plid'] = $this->plid;
                        //insert category in product table
                        $record = Products::create($product);
                        $this->plid++;
                        $productImage['product_id'] = $record->id;
                        $productImage['is_primary'] = true;
                        $productImage['url'] = $images->where('color', $product['color'])->first()['image'];
                        //insert record into product images table
                        ProductImages::create($productImage);
                    });
                }
                // return response()->json(['p_id' => $product['parent_id'], 'title' => $product['title'], 'is' => $isExist]);
            }
        }
        return response()->json(['status' => true, 'message' => 'Variants has been generated successfully', 'data' => []]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }
    private function updateVariants($images)
    {
        ProductVariantAttribute::where('product_id', request('product_id'))->delete();
        foreach (request('attributes') as $attribute) {
            $tmp['title'] = $attribute['title'];
            $tags  = strtolower($attribute['title']) == 'colors' ? $this->updateAttributeImages($attribute['tags'], $images) : $attribute['tags'];
            $tmp['tags'] = json_encode($tags);
            $tmp['created_at'] = now();
            $tmp['product_id'] = request('product_id');
            ProductVariantAttribute::create($tmp);
        }
    }
    private function updateAttributeImages($tags, $images)
    {
        foreach ($tags as &$tag) {
            $tag['image'] = $images->where('color', $tag['color'])->first()['image'];
        }
        return $tags;
    }
    private function getProductData($slug, $isVariant = false, $conditions = [])
    {
        $product =  Products::with('images')->where('slug', $slug)->first();
        $data['product']  = $product;
        $data['variantAttributes'] = ProductVariantAttribute::where('product_id', $product->id)->get();

        return $data;
    }
    public function getProductDetail($plid)
    {
        try {
            $product =  Products::with('images')->Join('vendor_products as pv', 'pv.product_id', '=', 'products.id')
                ->with('attribute')
                ->Join('users as us', 'us.id', '=', 'pv.seller_id')
                ->leftJoin('seller_requests', 'seller_requests.id', '=', 'us.seller_request_id')
                ->CheapVendorProduct()
                ->where('products.plid', $plid)
                ->where('pv.qty', '!=', 0)
                // ->where('pv.cost', '!=', 0)
                ->where('pv.selling_price', '!=', 0)
                // ->where('pv.price', '!=', 0)
                ->select('pv.id as pro_vendor_id',
                 'pv.price',
                  'pv.cost',
                   'pv.selling_price',
                    'pv.qty',
                     'pv.low_qty_alert',
                      'products.id',
                       'products.title',
                        'products.sub_title',
                        'products.slug',

                        'products.short_description',
                        'products.long_description',
                         'us.name','seller_requests.seller_company_name')->first();
                         $variants = $product->variants;

                         if($variants) {
                            if($product->images) {
                                //overwrite the image url of parent product
                                $product->images[0]->url = $variants[0]->url;
                                //overwrite of price of parent product
                                $product->price = $variants[0]->price;
                                //overwrite the selling price of parent product
                                $product->selling_price = $variants[0]->selling_price;
                            }
                         }
            $data['product']  = $product;
            $data['variantAttributes'] = ProductVariantAttribute::where('product_id', $product->id)->get();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function getProductRecord($id)
    {

        try {
            $product =  Products::with('images')
                ->Join('users as us', 'us.id', '=', 'products.added_by')
                ->where('products.id', $id)
                ->select('products.*', 'us.name')->first();
            $data['product']  = $product;
            $data['variantAttributes'] = ProductVariantAttribute::where('product_id', $product->id)->get();
            $data['product_category_custom_fields'] = ProductCategoryCustomFields::where('product_id', $product->id)->get();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function getProductVariant(Request $request)
    {
        // try {
        $request->validate([
            'plid' => ['required'],
            'condition' => ['required']
        ]);
        // $product =  Products::with('images')->where('slug', $request->product_slug)->first();
        $product =  Products::with('images')
        ->Join('vendor_products as pv', 'pv.product_id', '=', 'products.id')
        ->Join('users as us', 'us.id', '=', 'pv.seller_id')
        ->where('products.plid', $request->plid)
        // ->where('pv.qty', '!=', 0)
        // ->where('pv.cost', '!=', 0)
        // ->where('pv.selling_price', '!=', 0)
        // ->where('pv.price', '!=', 0)
        ->select(
            'pv.id as pro_vendor_id',
            'pv.price',
            'pv.cost',
            'pv.selling_price',
            'pv.qty',
            'pv.low_qty_alert',
            'products.id',
            'products.title',
            'products.sub_title',
            'us.name'
        )->first();
        // $data['product']  = $product;
        $selectedVariants = [];
        $conditions = [];
        foreach ($request->condition as $condition) {
            $conditions[] = $condition['value'];
        }
        $data['product'] = Products::with('images')
            ->Join('product_images as pi', 'pi.product_id', '=', 'products.id')
            ->Join('vendor_products as pv', 'pv.product_id', '=', 'products.id')
            ->Join('users as us', 'us.id', '=', 'pv.seller_id')
            ->where('products.parent_id', $product->id)
            ->whereJsonContains('products.variant_attribute', $conditions)
            ->select(
                'pv.id as pro_vendor_id',
                'pv.price',
                'pv.cost',
                'pv.selling_price',
                'pv.qty',
                'pv.low_qty_alert',
                'products.id',
                'products.title',
                'products.sub_title',
                'us.name',
                'pi.url'
            )->get();

        // foreach ($variants as $variant) {
        //     $title = collect(explode('-', $variant->title));
        //     // if (!array_diff($conditions, $title)) {
        //     //     $selectedVariants[] = $variant;
        //     // }
        //     if ($title->contains($condition)) {
        //         $selectedVariants[] = $variant;
        //     }
        // }
        return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }

    public function getCartProducts($productIds)
    {
        $list_ids = explode(',', $productIds);

        try {

            $products =  Products::with(['images' => function ($query) {
                $query->where('is_primary', 1);
            }])->Join('vendor_products as pv', 'pv.product_id', '=', 'products.id')
                ->whereIn('pv.id', $list_ids)
                ->select('products.id', 'pv.id as product_vendor_id', 'pv.price', 'pv.cost', 'pv.selling_price', 'pv.qty', 'pv.low_qty_alert', 'products.title', 'products.sub_title', 'products.added_by')->get();


            $data['products']  = $products;
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function existingProduct(Request $request)
    {
        // try {
        $data['product_list'] = Products::with(['images' => function ($query) {
            $query->where('is_primary', 1)->select('url', 'product_id');
        }])->when(is_numeric($request->title), function ($query, $title) {
            return $query->where('products.title', 'LIKE', "%{$title}%")->orWhere('products.plid', 'LIKE', "%{$title}%");
        })->join('categories as c', 'c.id', '=', 'products.category_id')
        // ->where('vp.seller_id','!=', $request->user()->id)
        // ->where('products.added_by','!=', $request->user()->id)
        ->select('products.*', 'c.name as category_name', 'c.commission_rate', 'c.bread_crumbs')
            // ->when($request->sortBy, function ($query, $sortBy) use ($request) {
            //     return $query->orderBy($sortBy, $request->sortDesc);
            // })
            ->paginate($request->perPage);

        return response()->json(['status' => true, 'message' => 'Products have been collected successfully', 'data' => $data]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }

    public function getSellerInventoryProducts(Request $request)
    {
        try {
            $data['product_list'] = Products::with(['images' => function ($query) {
                $query->where('is_primary', 1)->select('url', 'product_id');
            }])->with('variants')
            ->when($request->title, function ($query, $title) {
                return $query->where('products.title', 'LIKE', "%{$title}%")->orWhere('products.plid', 'LIKE', "%{$title}%");
            })
            ->Join('vendor_products as pv', 'pv.product_id', '=', 'products.id')
                ->where('pv.seller_id', $request->user()->id)
                // ->select('products.*')
                ->select('pv.id as vendor_product_id',
                'pv.msin',
                'pv.price',
                'pv.cost',
                'pv.selling_price',
                'pv.qty',
                'pv.low_qty_alert',
                'pv.status',
                'pv.list_status',
                'products.title',
                'products.sub_title',
                'pv.sku',
                'products.id')
                // ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                //     return $query->orderBy($sortBy, $request->sortDesc);
                // })
                ->paginate($request->perPage);

            return response()->json(['status' => true, 'message' => 'Products have been collected successfully', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
}
// php artisan migrate:rollback --path=/2021_06_16_123304_create_products_table.php
