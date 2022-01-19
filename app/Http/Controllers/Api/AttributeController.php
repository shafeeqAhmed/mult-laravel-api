<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Attribute;
use App\Models\CategoryAttribute;
use Illuminate\Validation\Rule;
use Exception;

class AttributeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $data['attributes'] = Attribute::when($request->q, function ($query, $q) {
                return $query->where('title', 'LIKE', "%{$q}%");
            })
                ->when($request->sortBy, function ($query, $sortBy) use ($request) {
                    return $query->orderBy($sortBy, $request->sortDesc);
                })
                ->paginate($request->perPage);

            return response()->json(['status' => true, 'message' => 'Attributes has been collect successfully', 'data' => $data]);
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
        // try {
        $validatedData = $request->validate([
            'title' => ['required', 'unique:attributes'],
            'is_file_able' => ['nullable'],
            'status' => ['required'],
        ]);
        $validatedData['status'] = strtolower($request->status) == 'active' ? 1 : 0;
        Attribute::create($validatedData);
        return response()->json(['status' => true, 'message' => 'Attribute has been added  successfully', 'data' => []]);
        // } catch (Exception $e) {
        //     return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        // }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        try {
            $data['attribute'] = Attribute::find($id);
            return response()->json(['status' => true, 'message' => 'Attribute has been fetch successfully', 'data' => $data]);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
    {
        try {
            $validatedData = $request->validate([
                'id' => ['required', 'numeric'],
            ]);
            $data['attribute'] = Attribute::find($validatedData['id']);
            return response()->json(['status' => true, 'message' => 'Attribute has been added  successfully', 'data' => []]);
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
    public function update(Request $request, $id)
    {
        try {
            $validatedData = $request->validate([
                'title' => ['required', Rule::unique('attributes')->ignore($id)],
                'status' => ['required'],
                'is_file_able' => ['nullable'],
            ]);
            $validatedData['status'] = strtolower($request->status) == 'active' ? 1 : 0;

            Attribute::find($id)->update($validatedData);

            return response()->json(['status' => true, 'message' => 'Attribute has been updated  successfully', 'data' => []]);
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
        //
    }
    public function assignAttributeToCategory(Request $request)
    {

        try {
            $validated = $request->validate([
                'attribute_id' => 'required',
                'category_id' => 'required',
                'status' => 'required',
            ]);

            $record = CategoryAttribute::where([
                'attribute_id' => $validated['attribute_id'],
                'category_id' => $validated['category_id'],
            ])->first();
            if ($record) {
                $record->update($validated);
            } else {
                CategoryAttribute::create($validated);
            }
            return response()->json(['status' => true, 'message' => 'Attribute has been assing to category successfully!', 'data' => []]);
        } catch (Exception $e) {

            return response()->json(['status' => false, 'message' => $e->getMessage(), 'data' => []]);
        }
    }
}
