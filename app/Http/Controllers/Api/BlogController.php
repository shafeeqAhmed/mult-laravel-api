<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pages;
use App\Models\Blogs;
use App\Models\BlogCategory;
use Illuminate\Http\Request;
use Exception;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;

use function BenTools\CartesianProduct\cartesian_product;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // try {
        $data['blogs'] = Blogs::when($request->q, function ($query, $q) {
            return $query->where('title', 'LIKE', "%{$q}%");
        })
            ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                return $query->orderBy($sortBy, $request->sortDesc);
            })
            ->paginate($request->perPage);
        return response()->json(['status' => true, 'message' => 'Blogs has been collect successfully', 'data' => $data]);
        // } catch (Exception $e) {

        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }
    public function create(Request $request)
    {
        // try {
        $validatedData = $request->validate([
            'title' => ['required'],
            'slug' => ['required'],
            'status' => ['required'],
            'category_id' => ['required'],
            'short_description' => ['required'],
        ]);
        $validatedData['meta_img'] = uploadImage('meta_img', 'blogs/meta_image', 300, 300);
        $validatedData['banner'] = uploadImage('banner', 'blogs/banner', 1300, 650);
        $validatedData['description'] = $request->description;
        $validatedData['meta_keywords'] = $request->meta_keywords;
        $validatedData['meta_description'] = $request->meta_description;
        $validatedData['meta_title'] = $request->meta_title;
        Blogs::create($validatedData);
        return response()->json(['status' => true, 'message' => 'Attribute has been added  successfully', 'data' => []]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }
    public function edit(Request $request, $id)
    {
        // try {
        // $validatedData = $request->validate([
        //     'id' => ['required', 'numeric'],
        // ]);
        $data['blogs'] = Blogs::find($id);
        return response()->json(['status' => true, 'message' => 'data fetch  successfully', 'data' => $data]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }
    public function update(Request $request, $id)
    {
        $input = $request->all();
        // try {
        $validatedData = $request->validate([
            'title' => ['required'],
            'slug' => ['required'],
            'status' => ['required'],
            'category_id' => ['required'],
            'short_description' => ['required'],
        ]);
        $blogs = Blogs::where('id', $id)->first();
        $validatedData['type'] = $str = str_replace(' ', '_', $validatedData['title']);
        if (empty($input['meta_img'])) {
            unset($input['meta_img']);
        } else {
            removeImage('blogs/meta_image', $blogs->meta_img);
            $validatedData['meta_img'] = uploadImage('meta_img', 'blogs/meta_image', 300, 300);
        }
        if (empty($input['banner'])) {
            unset($input['banner']);
        } else {
            removeImage('blogs/banner', $blogs->banner);
            $validatedData['banner'] = uploadImage('banner', 'blogs/banner', 1300, 650);
        }
        $validatedData['description'] = $request->description;
        $validatedData['meta_keywords'] = $request->meta_keywords;
        $validatedData['meta_description'] = $request->meta_description;
        $validatedData['meta_title'] = $request->meta_title;
        Blogs::find($id)->update($validatedData);

        return response()->json(['status' => true, 'message' => 'Blogs has been updated  successfully', 'data' => []]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }
    public function blog_category(Request $request)
    {
        // try {
        $data['Bcategory'] = BlogCategory::when($request->q, function ($query, $q) {
            return $query->where('category_name', 'LIKE', "%{$q}%");
        })
            ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                return $query->orderBy($sortBy, $request->sortDesc);
            })
            ->paginate($request->perPage);
        return response()->json(['status' => true, 'message' => 'Blogs category has been collect successfully', 'data' => $data]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function Bcategory_create(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'category_name' => ['required', 'unique:blog_categories'],
            ]);
            //$validatedData['status'] = strtolower($request->status) == 'active' ? 1 : 0;
            $validatedData['slug'] = Str::slug($request->category_name);
            BlogCategory::create($validatedData);
            return response()->json(['status' => true, 'message' => 'Blog category has been added  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function Bcategory_edit(Request $request, $id)
    {
        try {
            $data['Bcategory'] = BlogCategory::find($id);
            return response()->json(['status' => true, 'message' => 'data fetch  successfully', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function Bcategory_update(Request $request, $id)
    {
        $input = $request->all();
        try {
            $validatedData = $request->validate([
                'category_name' => ['required', Rule::unique('blog_categories')->ignore($id)],
            ]);
            $validatedData['slug'] = Str::slug($request->category_name);
            BlogCategory::find($id)->update($validatedData);
            return response()->json(['status' => true, 'message' => 'Blog category has been updated  successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }


     public function getCategoryBlogs(Request $request,$category)
    {

        try {
            if($category=='all'){
                $where=Blogs::inRandomOrder();
            }else{
              $where=Blogs::where("category_id",$category);                
            }

        $data['blogs'] = $where->when($request->q, function ($query, $q) {
            return $query->where('title', 'LIKE', "%{$q}%");
        })
            ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                return $query->orderBy($sortBy, $request->sortDesc);
            })->where('status',1)
            ->paginate($request->perPage);
        return response()->json(['status' => true, 'message' => 'Blogs has been collect successfully', 'data' => $data]);
         } catch (Exception $e) {

             return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
         }
    }

}
