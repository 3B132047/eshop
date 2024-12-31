<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;
use App\Models\User;

class OrderSeeder extends Seeder
{
    public function run()
    {
        // 產生 3 位使用者
        $users = User::factory(3)->create();

        foreach ($users as $user) {
            for ($i = 0; $i < 3; $i++) {
                Order::create([
                    'user_id' => $user->id,
                    'total_price' => 0, // 初始總價格
                ]);
            }
        }
    }
}
