<?php

use App\Http\Controllers\CartItemController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

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

//Route::resource('products', ProductController::class)->only([
//'index', 'show', 'store', 'update', 'destroy'
//]);

Route::get('products', [ProductController::class, 'index'])->name('products.index');
Route::get('products/{product}', [ProductController::class, 'show'])->name('products.show');
Route::get('products/create', [ProductController::class, 'create'])->name("products.create");
Route::post('products', [ProductController::class, 'store'])->name("products.store");
Route::get('products/{products}/edit', [ProductController::class, 'edit'])->name("products.edit");
Route::patch('products/{product}', [ProductController::class, 'update'])->name("products.update");
Route::delete('products/{product}', [ProductController::class, 'destroy'])->name("products.destroy");

/*
products.index:     GET|HEAD        products                            ProductController@index 列出所有產品

products.show:      GET|HEAD        products/{product}                  ProductController@show 檢視某一項產品

products.create:    GET|HEAD        products/create                     ProductController@create 新增產品的表單

products.store:     POST            products                            ProductController@store 儲存新增的產品

products.edit:      GET|HEAD        products/{product}/edit             ProductController@edit 修改某一項產品的表單

products.update:    PUT|PATCH       products/{product}                  ProductController@update 更新某一項產品

products.destroy:   DELETE          products/{product}                  ProductController@destroy 刪除某一項產品
*/
Route::resource('cart_items', CartItemController::class);
Route::resource('orders', OrderController::class);

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';