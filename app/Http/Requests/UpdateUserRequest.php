<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class UpdateUserRequest extends Request
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
            'email' => 'required_without:password|unique:oseba,email,'.Request::input('userid').',userid|email|max:30',
            'ime' => 'required_without:password|alpha|max:30',
            'priimek' => 'required_without:password|alpha|max:30',
            'naziv' => 'required_without:password|string|max:30',
            'izobrazba' => 'required_without:password|string|max:40',
            'rojstvo' => 'date',
            'telefon' => 'string|max:20',
            'opis' => 'string',
            'slika' => 'image|max:10000',
            'password' => 'string|min:6',
            'password_repeat' => 'required_with:password|same:password',
        ];
    }
}
