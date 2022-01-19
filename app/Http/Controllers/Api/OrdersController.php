<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminOrders;
use App\Models\SellerOrders;
use App\Models\OrderDetail;
use App\Models\Transactions;

use App\Models\Products;
use App\Models\User_balance;
use Exception;

class OrdersController extends Controller
{


    public function index()
    {
        try {

            $data['orders'] = AdminOrders::join('users as u', 'u.id', '=', 'admin_orders.customer_id')
                ->select(
                    'u.name as customer_name',
                    'admin_orders.*'
                )
                ->paginate();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);

        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function storeOrder(Request $request)
    {


        try {
            $order_total_product_qty = 0;
            $order_total_product_amount = 0;
            $order_unique_sequential_no = 'Or-100000';


            foreach ($request->products as $key => $product) {
                $order_total_product_amount += $product['local_qty'] * $product['price'];
                $order_total_product_qty += $product['local_qty'];
            }

            $order_total_product_amount += 30;

            $admin_orders = new AdminOrders();
            $admin_orders->customer_id = $request->user()->id;
            $admin_orders->total_product_amount = $order_total_product_amount;
            $admin_orders->total_product_qty = $order_total_product_qty;

            $adminOrders = AdminOrders::latest('unique_no')->first();
            if ($adminOrders) {
                $sequential_no = $adminOrders->unique_no;
                $sequential_no = explode('-', $sequential_no)[1];
                $sequential_no++;
                $order_unique_sequential_no = 'Or-' . $sequential_no;
            }


            $admin_orders->unique_no = $order_unique_sequential_no;
            $admin_orders->order_status = 'In Progress';
            $customer_order_no = AdminOrders::where('customer_id', $request->user()->id)->where('order_status', 'Completed')->count();
            $admin_orders->customer_order_no = $customer_order_no;
            $admin_orders->save();
            $admin_order_id = $admin_orders->id;


            $collection = collect($request->products);
            $collection = $collection->unique('added_by');
            $collection->all();
            $seller_ids = $collection->pluck('added_by');


            for ($i = 0; $i < count($seller_ids); $i++) {
                $seller_order_total_product_amount = 0;
                $seller_order_total_product_qty = 0;
                $products = collect($request->products)->where('added_by', $seller_ids[$i]);


                foreach ($products as $key => $product) {
                    $seller_order_total_product_qty += $product['local_qty'];
                    $price = $product['price'];
                    $seller_order_total_product_amount += $product['price'] * $product['local_qty'];
                }


                $seller_orders = new SellerOrders();

                $seller_sequential_no = 'Or-100000';
                $sellerOrders = SellerOrders::latest('unique_no')->first();

                if ($sellerOrders) {
                    $sequential_no = $sellerOrders->unique_no;
                    $sequential_no = explode('-', $sequential_no)[1];
                    $sequential_no++;
                    $seller_sequential_no = 'Or-' . $sequential_no;
                }

                $seller_orders->customer_id = $request->user()->id;
                $seller_orders->seller_id = $seller_ids[$i];
                $seller_orders->admin_order_id = $admin_order_id;
                $seller_orders->unique_no = $seller_sequential_no;
                $seller_orders->total_product_amount = $seller_order_total_product_amount += 30;
                $seller_orders->total_product_qty = $seller_order_total_product_qty;
                $seller_orders->order_status = 'In Progress';
                $seller_orders->save();

                foreach ($products as $key => $product) {

                    $order_detail = new OrderDetail();
                    $order_detail->admin_order_id = $admin_order_id;
                    $order_detail->seller_order_id = $seller_orders->id;
                    $order_detail->seller_id = $seller_ids[$i];
                    $order_detail->product_id = $product['id'];
                    $order_detail->product_qty = $product['local_qty'];
                    $order_detail->product_amount = $product['price'];
                    $order_detail->order_status = 'In Progress';
                    $order_detail->item_order_no =  $this->getItemNo();
                    $order_detail->save();

                }
            }


            return response()->json(['status' => true, 'message' => 'Order has been added  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function sellerOrder(Request $request)
    {
        try {
            // $data['orders'] = SellerOrders::when($request->q, function ($query, $q) {
            //     return $query->where('name', 'LIKE', "%{$q}%");
            // })
            //     ->when($request->sortBy, function ($query, $sortBy) use ($request) {
            //         return $query->orderBy($sortBy, $request->sortDesc);
            //     })
            //     ->when($request->type, function ($query, $type) {
            //         if ($type == 'parent') {
            //             $query->where('parent_id', 0);
            //         } else if ($type == 'sub') {
            //             $query->where('parent_id', '!=', 0);
            //         }
            //         return $query;
            //     })
            //     ->with('parent')
            $data['orders'] = SellerOrders::where('seller_id', $request->user()->id)
                ->when($request->q, function ($query, $q) {
                    return $query->where('c.name', 'LIKE', "%{$q}%");
                })
                ->join('users as c', 'c.id', '=', 'seller_orders.seller_order_customer_id')
                ->select('seller_orders.*', 'c.name as customer_name')
                ->paginate();

            return response()->json(['status' => true, 'message' => 'Orders has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    /*public function sellerOrder(Request $request)
    {
        try {
            // $data['orders'] = SellerOrders::when($request->q, function ($query, $q) {
            //     return $query->where('name', 'LIKE', "%{$q}%");
            // })
            //     ->when($request->sortBy, function ($query, $sortBy) use ($request) {
            //         return $query->orderBy($sortBy, $request->sortDesc);
            //     })
            //     ->when($request->type, function ($query, $type) {
            //         if ($type == 'parent') {
            //             $query->where('parent_id', 0);
            //         } else if ($type == 'sub') {
            //             $query->where('parent_id', '!=', 0);
            //         }
            //         return $query;
            //     })
            //     ->with('parent')
            $data['orders'] = SellerOrders::where('seller_id', $request->user()->id)
                ->when($request->q, function ($query, $q) {
                return $query->where('c.name', 'LIKE', "%{$q}%");
                })
                ->join('users as c', 'c.id','=', 'seller_orders.seller_order_customer_id')
                ->select('seller_orders.*','c.name as customer_name')
                ->paginate();

            return response()->json(['status' => true, 'message' => 'Orders has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }*/

    public function orderDetail($order)
    {

       try{

            $data['order']  = SellerOrders::with(['detail' => function ($query) {
                $query->join('products as p', 'p.id', '=', 'order_detail.order_product_id')
                    ->join('product_images as pi', 'pi.product_id', '=', 'p.id')
                    ->where('order_seller_id', request()->user()->id)
                    ->select('order_detail.*', 'p.title as product_title', 'pi.url as product_image');
            }])
                ->where('seller_order_unique_sequential_no', $order)
                ->where('seller_id', request()->user()->id)->first();
            return response()->json(['status' => true, 'message' => 'Orders has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function sellerOrders(Request $request)
    {
        try {

            $data['orders']  = OrderDetail::join('products as p', 'p.id', '=', 'order_detail.product_id')
                ->join('seller_orders as s', 's.id', '=', 'order_detail.seller_order_id')
                ->join('users as u', 'u.id', '=', 'order_detail.seller_id')
                ->where('order_detail.seller_id', $request->user()->id)
                ->where('u.product_on_hold', 0)
                ->select('order_detail.order_status as status', 'order_detail.product_qty as product_qty', 'order_detail.product_amount as amount', 's.*', 'p.title as product_title', 'p.sku as product_sku')->orderBy('order_detail.created_at', 'ASC')->paginate();

            return response()->json(['status' => true, 'message' => 'Orders has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function adminOrderDetail($orderNo)
    {
        try {


            $data['order'] = AdminOrders::with(['sellers.order_detail'])->where('unique_no', $orderNo)->first();
              
            return response()->json(['status' => true, 'message' => 'Orders has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


    public function productStatusChange(Request $request)
    {

        // try {
            $validated = $request->validate([

                'id' => 'required',
                'order_status' => 'required'
            ]);


            if ($validated['order_status'] == 'Completed') {


                $order_detail_id   = $validated['id'];

                $orderDetail = OrderDetail::find($validated['id']);
                $admin_order_id  = $orderDetail->admin_order_id;
                $seller_order_id = $orderDetail->seller_order_id;



                $transactions = Transactions::latest('transaction_no')->first();

                if ($transactions) {
                    $transaction_no = $transactions->transaction_no;
                    $transaction_no++;
                    $transaction_no = $transaction_no;
                } else {
                    $transaction_no = '10000';
                }


                $transaction_description = 'Your order has been completed';
                $qty = $orderDetail->product_qty;
                $order_amount = $orderDetail->product_amount * $qty;
                $category = Products::with('category')->where('id', $orderDetail->product_id)->first();
                $commission_rate = $category->category->commission_rate;
                $comission_paid = ($order_amount / 100) * $commission_rate;


                $transaction_data['admin_order_id'] = $admin_order_id;
                $transaction_data['seller_order_id'] = $seller_order_id;
                $transaction_data['order_detail_id'] =  $order_detail_id;
                $transaction_data['transaction_no'] = $transaction_no;

                $transaction_data['transaction_description'] =  $transaction_description;
                $transaction_data['order_amount'] = $order_amount;

                $transaction_data['comission_paid'] = $comission_paid;
                $transaction_data['qty'] = $qty;



                $transaction_data['transistion_type_id'] = 1;
                $transaction_data['user_id'] = $orderDetail->seller_id;
                $transaction_data['user_type'] = 'seller';
                $seller_balance = User_balance::where('user_id', $orderDetail->seller_id)->where('user_type', 'seller')->first();
                $seller_balance = $seller_balance->balance;
                $transaction_data['available_balance'] = $seller_balance;
                $transaction_data['current_balance'] = $seller_balance + $order_amount - $comission_paid;
                $transaction_data['transaction_type'] = 'Completed';

                $balance['balance'] = $seller_balance + $order_amount - $comission_paid;
                Transactions::create($transaction_data);

                User_balance::where(['user_id' => $orderDetail->seller_id, 'user_type' => 'seller'])->update($balance);

                //////////////////////////

                $customer_balance = SellerOrders::join('user_balances as ub', 'ub.user_id', '=', 'seller_orders.customer_id')
                    ->where('seller_orders.id', $orderDetail->seller_order_id)->where('user_type', 'customer')->first();


                $transaction_data['user_id']  = $customer_balance->user_id;


                $transaction_data['available_balance'] = $customer_balance->balance;



                $transaction_data['transistion_type_id'] = 2;

                $transaction_data['user_type'] = 'customer';


                $transactions = Transactions::latest('transaction_no')->first();

                if ($transactions) {
                    $transaction_no = $transactions->transaction_no;
                    $transaction_no++;
                    $transaction_no = $transaction_no;
                }

                $transaction_data['transaction_no'] = $transaction_no;

                $transaction_data['current_balance'] = $customer_balance->balance - $order_amount;

                $transaction_data['transaction_type'] = 'Completed';
                Transactions::create($transaction_data);
                $balance['balance'] = $customer_balance->balance - $order_amount;
                User_balance::where(['user_id' => $customer_balance->user_id, 'user_type' => 'customer'])->update($balance);
            } elseif ($validated['order_status'] == 'In Progress') {
                $this->cancelOrderCalculation('customer', $validated['id']);
                $this->cancelOrderCalculation('seller', $validated['id']);
            }


            $record = OrderDetail::where(['id' => $validated['id']])->update($validated);


            return response()->json(['status' => true, 'message' => 'Product Status has been changed successfully!', 'data' => []]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => true, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }

    public function getSellerTransactions(Request $request){

     try{

    $seller_transections['transactions']=Transactions::with('transaction_type','sellerOrder','orderDetail')->where(['user_id'=>$request->user()->id,'user_type'=>'seller'])->get();

    return response()->json(['status'=>true,'message'=>'Seller Transactions have been collected successfully','data'=>$seller_transections]);

     }catch(Exception $e){

      return response()->json(['status'=>true,'message'=>$e->getMessage(),'data'=>[]]);

     }

    }

    private function cancelOrderCalculation($user_type, $order_detail_id)
    {

        if ($user_type == 'customer') {
            $previous_transaction = Transactions::where([
                'order_detail_id' => $order_detail_id,
                'transaction_type' => 'Completed',
                'user_type' => 'customer'
            ])->orderBy('created_at', 'desc')->first();
        } elseif ($user_type == 'seller') {
            $previous_transaction = Transactions::where([
                'order_detail_id' => $order_detail_id,
                'transaction_type' => 'Completed',
                'user_type' => 'seller'
            ])->orderBy('created_at', 'desc')->first();
        }



        $previous_transaction->transaction_type = 'In Progress';
        $previous_transaction->transaction_description = 'Your order has been cancelled';

        $order_amount = $previous_transaction->order_amount;
        $current_balance = $previous_transaction->current_balance;
        $available_balance = $previous_transaction->available_balance;

        $transactions = Transactions::latest('transaction_no')->first();

        if ($transactions) {
            $transaction_no = $transactions->transaction_no;
            $transaction_no++;
            $transaction_no = $transaction_no;
        }


        $previous_transaction->available_balance = $current_balance;
        $previous_transaction->transaction_no = $transaction_no;

        if ($user_type == 'customer') {
            $previous_transaction->current_balance = $current_balance + $order_amount;
            $previous_transaction->transistion_type_id  = 3;
            Transactions::create(json_decode(json_encode($previous_transaction), true));
            $balance['balance'] = $current_balance + $order_amount;
            User_balance::where(['user_id' => $previous_transaction->user_id, 'user_type' => 'customer'])->update($balance);
        }

        if ($user_type == 'seller') {
            $previous_transaction->current_balance = $current_balance - $order_amount;
              $previous_transaction->transistion_type_id  = 4;
            Transactions::create(json_decode(json_encode($previous_transaction), true));

            $balance['balance'] = $current_balance - $order_amount;
            User_balance::where(['user_id' => $previous_transaction->user_id, 'user_type' => 'seller'])->update($balance);
        }
    }

    public function getItemNo() {

        $lastRecord = OrderDetail::latest('item_order_no')->first();

                if ($lastRecord) {
                    $item_no = $lastRecord->item_order_no;
                    $item_no++;
                    $item_no = $item_no;
                } else {
                    $item_no = '100000';
                }
    return $item_no;
}
}
