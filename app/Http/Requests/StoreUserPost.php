<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreUserPost extends FormRequest
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
        return [
            'name' => 'required|min:2|max:20',
            'email' => 'required|email',
        ];
    }

    protected $strings_key = [
        'name' => '用户名',
        'email' => '邮箱',
    ];

    protected $strings_val = [
        'required' => '为必填项',
        'min' => '最小为:min',
        'max' => '最大为:max',
        'between' => '长度在:min和:max之间',
        'integer' => '必须为整数',
        'email' => '必须为邮箱格式'
    ];

    public function messages()
    {
        $rules = $this->rules();
        $k_array = $this->strings_key;
        $v_array = $this->strings_val;
        foreach ($rules as $key => $value) {
            $new_arr = explode('|', $value);//分割成数组
            foreach ($new_arr as $k => $v) {
                $head = strstr($v, ':', true);//截取:之前的字符串
                if ($head) {
                    $v = $head;
                }
                $array[$key . '.' . $v] = $k_array[$key] . $v_array[$v];
            }
        }
        return $array;
    }
}
