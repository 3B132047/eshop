<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Category;

class ProductSeeder extends Seeder
{
    public function run()
    {
        $categories = Category::all();
        $products = [
            'Electronics' => ['Phone', 'Laptop', 'Camera', 'Headphones', 'Smart Watch'],
            'Clothing' => ['T-Shirt', 'Jeans', 'Jacket', 'Shoes', 'Hat'],
            'Books' => ['Novel', 'Biography', 'Science Fiction', 'Textbook', 'Comics'],
            'Home Appliances' => ['Microwave', 'Refrigerator', 'Vacuum Cleaner', 'Blender', 'Washing Machine'],
            'Toys' => ['Doll', 'Puzzle', 'Toy Car', 'Board Game', 'Lego Set'],
        ];

        foreach ($categories as $category) {
            foreach ($products[$category->name] as $product) {
                Product::create([
                    'name' => $product,
                    'category_id' => $category->id,
                ]);
            }
        }
    }
}
