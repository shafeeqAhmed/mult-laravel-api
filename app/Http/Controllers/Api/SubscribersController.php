<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Subscribers;
use Illuminate\Http\Request;
use Exception;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use Mail;
use App\Mail\DefaultMail;
use function BenTools\CartesianProduct\cartesian_product;

class SubscribersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
       try {
            $data['subscribers'] = Subscribers::when($request->q, function ($query, $q) {
                return $query->where('email', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->paginate($request->perPage);
				
			
            return response()->json(['status' => true, 'message' => 'Subscribers has been collect successfully', 'data' => $data]);
       } 
        catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function fetchsubscribers(Request $request)
    {
        try {
        $data['subscribers'] = Subscribers::select('email')->get();
        return response()->json(['status' => true, 'message' => 'Subscribers has been collect successfully', 'data' => $data]);

        } 
        catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    } 
    public function destroy($id)
    {
        try {

            Subscribers::where('id', $id)->delete();
            return response()->json(['status' => true, 'message' => 'Subscribers has been deleted successfully', 'data' => []]);
        } catch (Exception $e) {
  
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function newsletter_email(Request $request)
    {
	    
        $input  = $request->all();
    //    try {
            $data = array(
                'msg'=>$input['description'],
                'subject'=>$input['subject'],
                'file'=>'test_email'
            );
            if(!empty($input['useremail'])){
                $email = json_decode($input['useremail']);
                foreach($email as $to){
                    Mail::to($to)
                    ->send(new DefaultMail(json_encode($data)));
                }
               
            } if(!empty($input['subs_email'])){
                $email =  json_decode($input['subs_email']);
                foreach($email as $to){
                    Mail::to($to)
                    ->send(new DefaultMail(json_encode($data)));
                }
            }
            
            return response()->json(['status' => true, 'message' => 'Email has been sent  successfully', 'data' => []]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => 'Something is going wrong please try again!', 'data' => []]);
        // }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    

}