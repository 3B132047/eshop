<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\User;
use App\Models\Product;

class OrderSeeder extends Seeder
{
    public function run()
    {
        $users = User::all();
        $products = Product::all();

        foreach ($users as $user) {
            for ($i = 0; $i < 3; $i++) {
                $order = Order::create([
                    'user_id' => $user->id,
                    'total_price' => 0, // 這裡可以後續計算
                ]);

                // 為每個訂單加入 3 個不同的商品
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
        }
    }
}
