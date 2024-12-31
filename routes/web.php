<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use app\Http\Middleware\EnsureTokenIsValid;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::resource('products', ProductController::class);
/*
products.index:     GET|HEAD        products                            ProductController@index 列出所有產品

products.show:      GET|HEAD        products/{product}                  ProductController@show 檢視某一項產品

products.create:    GET|HEAD        products/create                     ProductController@create 新增產品的表單

products.store:     POST            products                            ProductController@store 儲存新增的產品

products.edit:      GET|HEAD        products/{product}/edit             ProductController@edit 修改某一項產品的表單

products.update:    PUT|PATCH       products/{product}                  ProductController@update 更新某一項產品

products.destroy:   DELETE          products/{product}                  ProductController@destroy 刪除某一項產品
*/
