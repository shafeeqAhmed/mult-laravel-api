<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\VendorProduct;
use App\Models\Products;
use App\Models\User;
use Mail;
use App\Mail\DefaultMail;

class VendorProductsController extends Controller
{
     public function index(Request $request)
    {
        try {
            $data['vendor_products'] = VendorProduct::when($request->q, function ($query, $q) {
                return $query->where('p.title', 'LIKE', "%{$q}%")->orwhere('u.name', 'LIKE', "%{$q}%")
                    ->orwhere('vendor_products.status', 'LIKE', "%{$q}%")->orwhere('vendor_products.price', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })->join('users as u', 'u.id', '=', 'vendor_products.seller_id')
            ->join('products as p','p.id','=','vendor_products.product_id')->select('u.name','p.title', 'vendor_products.*')
                ->paginate($request->perPage);

            return response()->json(['status' => true, 'message' => 'Vendor Products have been collect successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

        public function vendorProductStatus(Request $request)
    {
        try {
            $request->validate([
                'id' => 'required',
                'status' => 'required',
            ]);

           VendorProduct::where('id',$request->id)->update(['status'=>$request->status]);
            return response()->json(['status' => true, 'message' => 'Status updated Successfully!', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function changeListStatus(Request $request)
    {


        try {
            $validated = $request->validate([
                'id' => 'required',
                'list_status' => 'required',
            ]);

            $record = VendorProduct::where([
                'id' => $validated['id'],
            ])->update($validated);

            $product=VendorProduct::join('users as u','u.id','=','vendor_products.seller_id')->where('vendor_products.id',$validated['id'])->get();
             //  dd($product);
             $product=$product[0];
            $mail_data = new \stdClass;
            $mail_data->subject = 'Status Changed!';
            $mail_data->status = $product->list_status;
            $mail_data->name = $product->name;
            $mail_data->file = 'vendor_product';
            Mail::to($product->email)->send(new DefaultMail($mail_data));

            return response()->json(['status' => true, 'message' => 'List Status has been changed successfully!', 'data' => []]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function changeSellerProductStatus(Request $request)
    {


        // try {
            $validated = $request->validate([
                'id' => 'required',
                'status' => 'required',
            ]);

            $record = Products::where([
                'id' => $validated['id'],
            ])->update($validated);

            $product=Products::join('users as u','u.id','=','products.added_by')->where('products.id',$validated['id'])->get();

             $product=$product[0];
            $mail_data = new \stdClass;
            $mail_data->subject = 'Status Changed!';
            $mail_data->status = $product->status;
            $mail_data->name = $product->name;
            $mail_data->file = 'vendor_product';
            Mail::to($product->email)->send(new DefaultMail($mail_data));

            return response()->json(['status' => true, 'message' => 'Status has been changed successfully!', 'data' => []]);
        // } catch (Exception $e) {

        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }

}
