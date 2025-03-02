<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Leverancier;

class LeverancierController extends Controller {
    public function show($id) {
        $product = Product::findOrFail($id);
        $leverancier = $product->leverancier;
        return view('leverancier-info', compact('product', 'leverancier'));
    }
}