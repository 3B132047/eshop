<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\CartItem;
use App\Models\User;
use App\Models\Product;

class CartItemSeeder extends Seeder
{
    public function run()
    {
        $users = User::all();
        $products = Product::all();

        foreach ($users as $user) {
            $cartItems = $products->random(3);
            foreach ($cartItems as $product) {
                CartItem::create([
                    'user_id' => $user->id,
                    'product_id' => $product->id,
                    'quantity' => rand(1, 5),
                ]);
            }
        }
    }
}
