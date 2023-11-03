<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Occupation;

class OccupationController extends Controller
{
    public function create(){
        return view("occupation.create");

    }
    public function store(Request $request){

        $request->validate([
            'occupation_code'=>'required|min:4|max:8|string|unique:occupations,occupation_code',
            'occupation_name'=>'required|min:4,max:100|string',
            'occupation_description'=>'required|min:250|max:1000|string'
        ]);

        Occupation::create(['occupation_code'=>$request->occupation_code,
                            'occupation_name'=>$request->occupation_name,
                            'occupation_description'=>$request->occupation_description]);
    return redirect()->route('occupation.create');
}


}