<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;

class OrderItemSeeder extends Seeder
{
    public function run()
    {
        $orders = Order::all();
        $products = Product::all();

        foreach ($orders as $order) {
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
