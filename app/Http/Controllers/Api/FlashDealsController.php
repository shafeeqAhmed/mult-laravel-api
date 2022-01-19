<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Flashdeals;
use App\Models\FlashdealProduct;
use App\Models\Products;
use App\Models\VendorProduct;
use Illuminate\Http\Request;
use Exception;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;

use function BenTools\CartesianProduct\cartesian_product;

class FlashDealsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
       try {
            $data['flashdeals'] = Flashdeals::when($request->q, function ($query, $q) {
                return $query->where('title', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->paginate($request->perPage);
            return response()->json(['status' => true, 'message' => 'Flash Deals has been collect successfully', 'data' => $data]);
       }
        catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function update_status(Request $request){
        try {
            Flashdeals::where('id',$request->id)->update(['status'=>$request->status]);
            return response()->json(['status' => true, 'message' => 'Status updated Successfully!', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function update_featured(Request $request){
        try {
            Flashdeals::where('id',$request->id)->update(['featured'=>$request->featured]);
            return response()->json(['status' => true, 'message' => 'Featured updated Successfully!', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function productDetail(Request $request){
        try{
            // $data['products'] = VendorProduct::with(['product'=>function($query){
            //     $query->where('is_primary',1);
            // }  ])->whereIn('id',explode(",",$request->products_id))->select('id','price','qty','title')->get();
            // //print_r($data['products'] );
            $vendorProduct = VendorProduct::whereIn('id',explode(",",$request->products_id))->get();
            $data['products'] = [];
            foreach($vendorProduct as $p){
                $data['products'][] =   array(
                    'id'=>$p->product->id,
                    'title'=>$p->product->title,
                    'msin'=>$p['msin'],
                    'price'=>$p['price'],
                    'discount'=>$this->checkvendor_product($request->flash_deal_id,$p->product->id) !=false?$this->checkvendor_product($request->flash_deal_id,$p->product->id):$p['discount'],
                    'qty'=>$p['qty'],
                    'images'=>$p->product->images->where('is_primary',1)
                );
            }
            return response()->json(['status' => true, 'message' => 'Products has been collect successfully', 'data' => $data]);
            }
        catch(Exception $e){
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);

        }
    }
    public function checkvendor_product($deal_id , $product_id){
      if(!empty($deal_id)){
        $productDiscount =   FlashdealProduct::where('product_id',$product_id)->where('flash_deal_id',$deal_id)->pluck('discount');
        if(!empty($productDiscount[0])){
            return $productDiscount[0];
       }
       else{
           return false;
       }  
    }
    else{
        return false;
    }
     // print_r( $productDiscount);exit;
     
    }
    public function edit(Request $request, $id)
    {
        // try {
            $data['flashdeal'] = Flashdeals::find($id);
            $product_ids = array_values(FlashdealProduct::where('flash_deal_id',$id)->pluck('product_id')->toArray());
            $data['product_ids'] =  Products::whereIn('id',$product_ids)->select('id','title')->get();
           // $data['products'] =
             $vendorProduct = VendorProduct::whereIn('product_id',$product_ids)->get();
            $data['products'] = [];
            foreach($vendorProduct as $p){
                $data['products'][] =   array(
                    'id'=>$p->product->id,
                    'title'=>$p->product->title,
                    'msin'=>$p['msin'],
                    'price'=>$p['price'],
                    'discount'=>$this->checkvendor_product($id,$p->product->id) !=false?$this->checkvendor_product($id,$p->product->id):$p['discount'],
                    'qty'=>$p['qty'],
                    'images'=>$p->product->images->where('is_primary',1)
                );
            }
            // $data['products'] =  Products::with(['images'=>function($query){
            //     $query->where('is_primary',1);
            // }  ])->whereIn('id',$product_ids)->select('id','price','qty','title')->get();
            //$data['product_ids'] = implode(',',FlashdealProduct::where('flash_deal_id',$id)->pluck('product_id')->toArray());
            ////need to check
            // $vendorProduct = VendorProduct::whereIn('id',explode(",",$request->products_id))->get();
            // $data['products'] = [];
            // foreach($vendorProduct as $p){
            //     $data['products'][] =   array(
            //         'id'=>$p->product->id,
            //         'title'=>$p->product->title,
            //         'msin'=>$p['msin'],
            //         'price'=>$p['price'],
            //         'discount'=>$this->checkvendor_product($p->product->id) !=false?$this->checkvendor_product($p->product->id):$p['discount'],
            //         'qty'=>$p['qty'],
            //         'images'=>$p->product->images->where('is_primary',1)
            //     );
            // }

            // end check 
            return response()->json(['status' => true, 'message' => 'data fetch  successfully', 'data' => $data]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
  
        $validatedData = $request->validate([
            'title' => ['required', 'unique:pages'],
            'background_color' => ['required'],
            'timer_status' => ['required'],
            'start_date' => ['required'],
            'end_date' => ['required'],
           // 'banner' => ['required'],
        ]);
        $validatedData['timer_status'] = $validatedData['timer_status']==true? 1:0;
        $validatedData['banner'] = uploadImage('banner', 'flashdeal/banner', 300, 300);
        $validatedData['slug'] = Str::slug($request->title);
        $FalashDealID = Flashdeals::insertGetId($validatedData);
        if(!empty($request->TableProduct)){
            $FlashDealProducts = json_decode($request->TableProduct,true);
            foreach($FlashDealProducts as $product){
                $productArray = [];
                $productArray = array(
                    'flash_deal_id'=>$FalashDealID,
                    'product_id'=>$product['id'],
                    'discount'=>$product['discount'],
                );
                FlashdealProduct::create($productArray);
            }
        }
        return response()->json(['status' => true, 'message' => 'Flash Deal has been added  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function fetchproducts(Request $request){
     try{
            //with(['images'=>function($query){$query->where('is_primary',1); }  ])
            $data['products'] =  Products::select('id','title')->get();
            $vendor_product = VendorProduct::all();
            $data['products'] = [];
            foreach($vendor_product as $p){
            $data['products'][] =array(
              'id'=>$p['id'],
                'title'=>$p['msin'].'-'.$p->product->title,
            ); 
            }
            $data['dealProducts'] = array_values(FlashdealProduct::pluck('product_id')->toArray());
            $data['outofstock'] =   array_values(Products::where('qty','<=',0)->pluck('id')->toArray());
            return response()->json(['status' => true, 'message' => 'Flash Deals has been collect successfully', 'data' => $data]);
        }
        catch(Exception $e){
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function update(Request $request, $id)
    {
        $input = $request->all();
        try {
  
            $validatedData = $request->validate([
                'title' => ['required', 'unique:pages'],
                'background_color' => ['required'],
                'timer_status' => ['required'],
                'start_date' => ['required'],
                'end_date' => ['required'],
               // 'banner' => ['required'],
            ]);
            $blogs = Flashdeals::where('id', $id)->first();
            $validatedData['timer_status'] = $validatedData['timer_status']==true? 1:0;
            if (empty($input['banner'])) {
                unset($input['banner']);
            } else {
                removeImage('flashdeal/banner', $blogs->banner);
                $validatedData['banner'] = uploadImage('banner', 'blogs/banner', 1300, 650);
            }
            $validatedData['banner'] = uploadImage('banner', 'flashdeal/banner', 300, 300);
            $validatedData['slug'] = Str::slug($request->title);
            Flashdeals::find($id)->update($validatedData);
            if(!empty($request->TableProduct)){
                if(!empty(FlashdealProduct::where('flash_deal_id',$id)->get()->toArray())){
                    FlashdealProduct::where('flash_deal_id',$id)->delete();
                }
                $FlashDealProducts = json_decode($request->TableProduct,true);
                foreach($FlashDealProducts as $product){
                    $productArray = [];
                    $productArray = array(
                        'flash_deal_id'=>$id,
                        'product_id'=>$product['id'],
                        'discount'=>$product['discount'],
                    );
                    FlashdealProduct::create($productArray);
                }
            }
            return response()->json(['status' => true, 'message' => 'Flash Deal has been updated  successfully', 'data' => []]);
            } catch (Exception $e) {
                return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
            }
           Pages::find($id)->update($validatedData);

            return response()->json(['status' => true, 'message' => 'page has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function destroy($id)
    {
        try {
            Flashdeals::where('id', $id)->delete();
            FlashdealProduct::where('flash_deal_id', $id)->delete();
            return response()->json(['status' => true, 'message' => 'flashdeal has been deleted successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
}