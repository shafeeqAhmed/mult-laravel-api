<?php

namespace App\Http\Controllers\Api;

use App\Models\CustomFields;
use App\Models\CategoryCustomFields;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Support\Facades\DB;
use Exception;

class CustomFieldsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $data['fields'] = CustomFields::when($request->q, function ($query, $q) {
                return $query->where('title', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                // ->when($request->type, function ($query, $type) {
                //     if ($type == 'parent') {
                //         $query->where('parent_id', 0);
                //     } else if ($type == 'sub') {
                //         $query->where('parent_id', '!=', 0);
                //     }
                //     return $query;
                // })
                // ->with('parent')
                ->paginate($request->perPage);

            return response()->json(['status' => true, 'message' => 'Category has been collect successfully', 'data' => $data]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
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
        try {
            $request->validate([
                'title' => ['required'],
            ]);
            CustomFields::create($request->all());
            return response()->json(['status' => true, 'message' => 'Fields has been added successfully!', 'data' => []]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CustomFields  $customFields
     * @return \Illuminate\Http\Response
     */
    public function show(CustomFields $customFields, $id)
    {
        $customField = CustomFields::where('id', $id)->first();
        return response()->json($customField);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CustomFields  $customFields
     * @return \Illuminate\Http\Response
     */
    public function edit(CustomFields $customFields)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CustomFields  $customFields
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $customFields)
    {
        try {
            CustomFields::find($customFields)->update($request->all());
            return response()->json(['status' => true, 'message' => 'Fields has been Updated successfully!', 'data' => []]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CustomFields  $customFields
     * @return \Illuminate\Http\Response
     */
    public function destroy(CustomFields $customFields)
    {
        //
    }
    public function assignCustomFieldToCategory(Request $request)
    {

        try {
            $validated = $request->validate([
                'custom_field_id' => 'required',
                'category_id' => 'required',
                'status' => 'required',
            ]);

            $record = CategoryCustomFields::where([
                'custom_field_id' => $validated['custom_field_id'],
                'category_id' => $validated['category_id'],
            ])->first();

            if ($record) {
                $record->update($validated);
            } else {
                CategoryCustomFields::create($validated);
            }
            return response()->json(['status' => true, 'message' => 'Fields has been assing to category successfully!', 'data' => []]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function fetchCategoryCustomFields($category_id)
    {
        try {
            $data['fields'] = CategoryCustomFields::join('custom_fields as cf', 'cf.id', '=', 'category_custom_fields.custom_field_id')
                ->where('category_custom_fields.category_id', $category_id)
                ->where('category_custom_fields.status', 1)
                ->select('category_custom_fields.*', 'cf.fields', 'cf.title', 'cf.collapse', DB::raw("false as hidden"))
                ->get();
            $data['attributes'] = Category::join('category_attributes as ca', 'ca.category_id', '=', 'categories.id')
                ->join('attributes as a', 'a.id', '=', 'ca.attribute_id')
                ->where('ca.category_id', $category_id)
                ->where('ca.status', 1)
                ->select('a.*')
                ->get();
            return response()->json(['status' => true, 'message' => 'Fields has been Updated successfully!', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
    public function storeProductCustomFields(Request $request)
    {
        dd($request->data, json_decode($request->data));
    }
}
