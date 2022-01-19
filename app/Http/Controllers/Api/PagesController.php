<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductCategoryCustomFields;
use App\Models\ProductImages;
use App\Models\Products;
use App\Models\Pages;
use Illuminate\Http\Request;
use Exception;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;

use function BenTools\CartesianProduct\cartesian_product;

class PagesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
       try {
            $data['pages'] = Pages::when($request->q, function ($query, $q) {
                return $query->where('title', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->paginate($request->perPage);
            return response()->json(['status' => true, 'message' => 'Pages has been collect successfully', 'data' => $data]);
       } 
        catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function edit(Request $request, $id)
    {
        // try {
            // $validatedData = $request->validate([
            //     'id' => ['required', 'numeric'],
            // ]);
            $data['page'] = Pages::find($id);
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
    public function create(Request $request)
    {
         try {
        $validatedData = $request->validate([
            'title' => ['required', 'unique:pages'],
            'slug' => ['required'],
            'meta_title' => ['required'],
            'meta_description' => ['required'],
            'keywords' => ['required'],
        ]);
        $validatingData['content'] = $request->content;
        $validatingData['meta_image'] = uploadImage('meta_image', 'pages/meta_image', 300, 300);
        $validatedData['type'] = $str = str_replace(' ', '_', $validatedData['title']);
        //$validatedData['status'] = strtolower($request->status) == 'active' ? 1 : 0;
        Pages::create($validatedData);
        return response()->json(['status' => true, 'message' => 'Attribute has been added  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function update(Request $request, $id)
    {
        $input = $request->all();
        try {
            $validatedData = $request->validate([
                'title' => ['required',  Rule::unique('pages')->ignore($id)],
                'slug' => ['required'],
                'meta_title' => ['required'],
                'meta_description' => ['required'],
                'keywords' => ['required'],
            ]);
           $pages = Pages::where('id', $id)->first();
           $validatedData['type'] = $str = str_replace(' ', '_', $validatedData['title']);
           $validatedData['content'] = $request->content;
           if (empty($input['mata_image'])) {
            unset($input['mata_image']);
            } else {
                removeImage('pages/meta_image', $pages->meta_image);
                $validatedData['meta_image'] = uploadImage('meta_image', 'pages/meta_image', 170, 170);
            }
           Pages::find($id)->update($validatedData);

            return response()->json(['status' => true, 'message' => 'page has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

}