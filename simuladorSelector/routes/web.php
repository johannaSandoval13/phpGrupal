<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OccupationController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
//ruta para llamar el form
route::get('occupation/create',[OccupationController::class,'create'])->name('occupation.create');
//ruta para enviar datos
route::post('occupation/store',[OccupationController::class,'store'])->name('occupation.store');