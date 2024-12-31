<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\CartItem;
use App\Models\Product;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        // 呼叫類別和商品的 Seeder
        $this->call([
            CategorySeeder::class,
            ProductSeeder::class,
        ]);

        // 生成 3 位使用者
        $users = User::factory(3)->create();

        $products = Product::all();

        foreach ($users as $user) {
            // 每位使用者生成 3 筆訂單
            for ($i = 0; $i < 3; $i++) {
                $order = Order::create([
                    'user_id' => $user->id,
                    'total_price' => 0, // 初始價格
                ]);

                // 每筆訂單生成 3 個訂單項目
                $orderItems = $products->random(3);
                $totalPrice = 0;

                foreach ($orderItems as $product) {
                    OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $product->id,
                        'quantity' => rand(1, 5),
                        'price' => $product->price,
                    ]);
                    $totalPrice += $product->price;
                }

                $order->update(['total_price' => $totalPrice]);
            }

            // 每位使用者生成 3 個購物車項目
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
