<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Volumetric;
use Illuminate\Http\Request;
use Exception;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use function BenTools\CartesianProduct\cartesian_product;

class ShippingController extends Controller
{
    
    public function volumetric(Request $request)
    { 
	   
        try {
            $data['volumetric'] = Volumetric::when($request->q, function ($query, $q) {
                return $query->where('min_weight', 'LIKE', "%{$q}%")->orWhere('max_weight', 'LIKE', "%{$q}%")->orWhere('per_kg_price', 'LIKE', "%{$q}%")->orWhere('default_price', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->paginate($request->perPage);
				
			
            return response()->json(['status' => true, 'message' => 'Volumetric has been collect successfully', 'data' => $data]);
       } 
        catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    } 
	public function volumetric_edit(Request $request)
    { 
	   
        try {
            $data['volumetric'] = Volumetric::find($request->id);
				
			
            return response()->json(['status' => true, 'message' => 'Volumetric has been collect successfully', 'data' => $data]);
       } 
        catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
	public function volumetric_update(Request $request,$id)
    { 
	   
        $input = $request->all();
        try {
            $validatedData = $request->validate([
                'min_weight' => ['required'],
                'max_weight' => ['required'],
                'default_price' => ['required'],
                'per_kg_price' => ['required'],
               
            ]);
          
           
                $validatedData['min_weight'] = $request->min_weight;
                $validatedData['max_weight'] = $request->max_weight;
                $validatedData['default_price'] = $request->default_price;
                $validatedData['per_kg_price'] = $request->per_kg_price;
                Volumetric::where('id',$id)->update($validatedData);

            return response()->json(['status' => true, 'message' => 'Volumetric has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

}
