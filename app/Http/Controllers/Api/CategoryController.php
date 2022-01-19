<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\CategoryStoreRequest;
use App\Models\Category;
use App\Models\CategoryCustomFields;
use App\Models\Products;
use App\Models\BlogCategory;
use Exception;
use IlluminateAgnostic\Collection\Support\Str;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public $categories;
    public function index(Request $request)
    {
        try {
            $data['categories'] = Category::when($request->q, function ($query, $q) {
                return $query->where('name', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->when($request->type, function ($query, $type) {
                    if ($type == 'parent') {
                        $query->where('parent_id', 0);
                    } else if ($type == 'sub') {
                        $query->where('parent_id', '!=', 0);
                    }
                    return $query;
                })
                ->with('parent')
                ->paginate($request->perPage);

            return response()->json(['status' => true, 'message' => 'Category has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function getBlogCategories(Request $request)
    {
        try {
            $data['blogs'] = BlogCategory::limit(7)->get();
            return response()->json(['status' => true, 'message' => 'Blogs have been collect successfully', 'data' => $data]);
       }
        catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function makeBreadCrumb($breadCrumbList)
    {
        $breadCrumb = '';
        foreach ($breadCrumbList as $key => $list) {
            if ($key == 0) {
                $breadCrumb .= $list->name;
            } else {
                $breadCrumb .= ' > ' . $list->name;
            }
        }
        return $breadCrumb;
    }
    public function store(CategoryStoreRequest $request)
    {
        try {
            $validatingData = $request->validated();
            $validatingData['slug'] = Str::of($validatingData['name'])->slug('-');
            $validatingData['banner'] = uploadImage('banner', 'admin/categories', 300, 300);
            $validatingData['icon'] = uploadImage('icon', 'admin/categories', 100, 100);
            if ($request->parent_id == 0) {
                $validatingData['bread_crumbs'] = $request->bread_crumbs;
            } else {
                $breadCrumb = $this->makeBreadCrumb(json_decode($request->bread_crumbs));
                $breadCrumb .= ' > ' . $validatingData['name'];
                $validatingData['bread_crumbs'] = $breadCrumb;
            }

            Category::create($validatingData);
            return response()->json(['status' => true, 'message' => 'Category has been added successfully', 'data' => []]);
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
        try {

            $data['category'] = Category::where('id', $id)->first();
            return response()->json(['status' => true, 'message' => 'Category has been fetch successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CategoryStoreRequest $request, $id)
    {
        try {
            $category = Category::where('id', $id)->first();
            $validatingData = $request->validated();
            $validatingData['slug'] = Str::of($validatingData['name'])->slug('-');
            if (is_null($validatingData['banner'])) {
                unset($validatingData['banner']);
            } else {
                removeImage('admin/categories', $category->banner);
                $validatingData['banner'] = uploadImage('banner', 'admin/categories', 170, 170);
            }

            if (is_null($validatingData['icon'])) {
                unset($validatingData['icon']);
            } else {
                removeImage('admin/categories', $category->icon);
                $validatingData['icon'] = uploadImage('icon', 'admin/categories', 100, 100);
            }

            $breadCrumbArray = json_decode($request->bread_crumbs);
            if ($breadCrumbArray) {
                $breadCrumbArray[count($breadCrumbArray) - 1]->name = $validatingData['name'];
                $validatingData['bread_crumbs'] = $this->makeBreadCrumb($breadCrumbArray);
            }

            $category->update($validatingData);

            return response()->json(['status' => true, 'message' => 'Category has been updated successfully', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {

            Category::where('id', $id)->delete();
            return response()->json(['status' => true, 'message' => 'Category has been deleted successfully', 'data' => []]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function CategoryChilds($id)
    {
        // try {
        $this->categories = Category::all();
        $data['parent_id'] = $id;
        $data['breadCrum'] = $this->formateBreadCrum($this->getParent($id));
        $data['childs'] = Category::with('child')->where('parent_id', $id)
            ->select('id', 'name', 'commission_rate', DB::raw("false as isSelected"))
            ->get();
        return response()->json(['status' => true, 'message' => 'Category Child has been collected successfully', 'data' => $data]);
        // } catch (Exception $e) {

        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }

    public function getParent($parent_id)
    {

        $name = '';
        $category = $this->categories->where('id', $parent_id)->first();

        if ($category) {
            $name .= $category->id;
            $name .= ',' . $category->name;
            $name .= ',' . $category->commission_rate;

            if ($category->parent_id != 0 && $category->parent_id != $category->id) {
                $name .= ' > ' . $this->getParent($category->parent_id);
            }
        }

        //Electronic >audio > earphone > wf
        return $name;
    }
    public function formateBreadCrum($breadCrum)
    {
        $breadCrum = explode(">", $breadCrum);
        $arr = array();
        if (count($breadCrum)) {
            foreach ($breadCrum as $key => $value) {
                $breadArr = explode(",", $value);
                $tmp = array();
                if ($key == 0) {
                    $tmp = [
                        'id' => $breadArr[0],
                        'name' => $breadArr[1],
                        'commission_rate' => $breadArr[2],
                        'active' => true
                    ];
                } else {
                    $tmp = [
                        'id' => $breadArr[0],
                        'name' => $breadArr[1],
                        'commission_rate' => $breadArr[2],
                    ];
                }
                $arr[] = $tmp;
            }
        }
        return array_reverse($arr);
    }
    public function all($type)
    {
        $query = Category::with('child')->where('status', 1);
        if ($type == 'parent') {
            $query->where('parent_id', '=', 0);
        } else if ($type == 'child') {
            $query->where('parent_id', '!=', 0);
        }
        $all = $query->select('*', DB::raw('false as isSelected'))->get();
        return response()->json($all);
    }
    public function CategoryBreadCrumSearchCustomFields($keyword, $categoryId)
    {
        try {
            // dd(DB::table('categories')->pluck('parent_id'));
            $data['categories'] = Category::leftJoin('category_custom_fields as ccf', function ($join) use ($categoryId) {
                $join->on('ccf.category_id', '=', 'categories.id')
                    ->where('ccf.custom_field_id', '=', $categoryId);
            })
                ->when($keyword, function ($query, $keyword) {
                    if (is_numeric($keyword)) {
                        $query->where('categories.id', '=', $keyword);
                    } else {
                        $query->where('bread_crumbs', 'LIKE', "%{$keyword}%");
                    }
                })
                ->whereNotIn('categories.id', DB::table('categories')->pluck('parent_id'))
                ->select('categories.*', 'ccf.status as field_status')
                ->get();

            return response()->json(['status' => true, 'message' => 'Category has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function CategoryBreadCrumSearchAttributes($keyword, $attributeId)
    {
        try {
            $data['categories'] = Category::leftJoin('category_attributes as ca', function ($join) use ($attributeId) {
                $join->on('ca.category_id', '=', 'categories.id')
                    ->where('ca.attribute_id', '=', $attributeId);
            })
                ->when($keyword, function ($query, $keyword) {
                    if (is_numeric($keyword)) {
                        $query->where('categories.id', '=', $keyword);
                    } else {
                        $query->where('bread_crumbs', 'LIKE', "%{$keyword}%");
                    }
                })
                ->whereNotIn('categories.id', DB::table('categories')->pluck('parent_id'))
                ->select('categories.*', 'ca.status as attribute_status')
                ->get();

            return response()->json(['status' => true, 'message' => 'Category has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function categoryCustomFields($category_id)
    {
        try {
            $data['fields'] = CategoryCustomFields::join('custom_fields as cf', 'cf.id', '=', 'category_custom_fields.custom_field_id')
                ->where('category_custom_fields.category_id', $category_id)
                ->select('category_custom_fields.*', 'cf.title')
                ->get();
            $data['breadCrumb'] = Category::where('id', $category_id)->value('bread_crumbs');
            return response()->json(['status' => true, 'message' => 'Category has been deleted successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    public function SubCategory()
    {
        dd('this is the sub category');
    }
    public function categoryAttributes($category_id)
    {
        try {
            $data['attributes'] = Category::join('category_attributes as ca', 'ca.category_id', '=', 'categories.id')
                ->join('attributes as a', 'a.id', '=', 'ca.attribute_id')
                ->where('ca.category_id', $category_id)
                // ->where('a.status', 1)
                ->select('a.*', 'categories.id as category_id', 'ca.status as category_attribute_status')
                ->get();
            $data['breadCrumb'] = Category::where('id', $category_id)->value('bread_crumbs');
            return response()->json(['status' => true, 'message' => 'Category Attribute has been fetched successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function getCategoryById($id)
    {
        try {

            $data['category'] = Category::where('id', $id)->first();
            return response()->json(['status' => true, 'message' => 'Category has been fetched successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function getCategories()
    {
        try {
            $data['categories'] = Category::where('status', 1)
                ->select('id', 'name', 'slug', 'icon', 'banner')
                ->where('parent_id', 0)
                ->get();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function getAppearanceCategory()
    {
        try {
            //DB::enableQueryLog();

            $data['apperanceCategory'] = Category::with(['products' => function ($query) {
                // $query->with(['variants']);
                $query->CheapVendorProduct();
                $query->select('pv.id as product_vendor_id',
                 'products.id',
                 'products.category_id',
                  'products.title',
                   'products.slug',
                    'pi.url',
                     'pv.selling_price',
                     'pv.price',
                      'products.is_variant',
                       'products.plid',
                       'us.name',
                    'seller_requests.seller_company_name')
                    ->Join('product_images as pi', 'pi.product_id', '=', 'products.id')
                    ->Join('vendor_products as pv', 'pv.product_id', '=', 'products.id')
                    ->Join('users as us', 'us.id', '=', 'pv.seller_id')
                    ->leftJoin('seller_requests', 'seller_requests.id', '=', 'us.seller_request_id')

                    // ->Join('product_variant_attributes as pva','pva.product_id','=', 'products.id')
                    ->where('pi.is_primary', 1)
                    ->where('pv.list_status', 'approved')
                    ->where('pv.status', 'active')
                    // ->where('pv.price', '!=',0)
                    // ->where('pv.cost', '!=',0)
                    ->where('pv.selling_price', '!=',0)
                    ->where('pv.qty', '!=',0)
                    ->where('products.is_variant', 0);
            }])
                ->whereIn('categories.id', [2])
                ->select('categories.id', 'categories.name', 'categories.slug')
                ->get();
             // print_r(DB::getQueryLog());//print sql query

            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function getCategoryProducts($slug)
    {
        try {
              $data['categoryProducts'] = Category::with(['products' => function ($query) {
                $query->CheapVendorProduct();
                $query->select('pv.product_id as id',
                 'products.category_id',
                    'products.plid',
                  'products.title',
                   'products.slug',
                    'pi.url',
                     'pv.selling_price',
                     'pv.price',
                    'seller_requests.seller_company_name')
                    ->join('vendor_products as pv', 'pv.product_id', '=', 'products.id')
                    ->join('product_images as pi', 'pi.product_id', '=', 'pv.product_id')
                    ->Join('users as us', 'us.id', '=', 'pv.seller_id')
                    ->leftJoin('seller_requests', 'seller_requests.id', '=', 'us.seller_request_id')
                    ->where('products.is_variant',0)
                    ->where('pv.list_status', 'approved')
                    ->where('pv.qty','!=', 0)
                     ->where('pv.selling_price','!=', 0)
                    // ->where('pv.price','!=', 0)
                    //  ->where('pv.cost','!=', 0)
                    ->where('pi.is_primary', 1);
            }])
                ->where('slug', $slug)
                ->select('id', 'name', 'slug')
                ->first();
            return response()->json(['status' => true, 'message' => '', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
}
