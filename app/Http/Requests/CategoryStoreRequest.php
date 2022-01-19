<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CategoryStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        switch ($this->method()) {
            case 'PUT':
                $name = ['required', Rule::unique('categories')->ignore($this->category),];
                $bread_crumbs = 'required';
                break;
            default:
                $name = 'required|string|unique:categories';
                $bread_crumbs = 'nullable';
                break;
        }
        return [
            'parent_id' => 'nullable|integer',
            'level' => 'nullable|integer',
            'name' => $name,
            'commission_rate' => 'nullable',
            'banner' => 'nullable',
            'icon' => 'nullable',
            'featured' => 'nullable|boolean',
            'top' => 'nullable',
            'slug' => 'nullable',
            'bread_crumbs' => $bread_crumbs,
            'meta_title' => 'nullable',
            'meta_description' => 'nullable',
            'status' => 'nullable',
        ];
    }
}
