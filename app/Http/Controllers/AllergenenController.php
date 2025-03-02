<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Allergeen;
use App\Models\Leverancier;

class AllergenenController extends Controller {
 
public function index() {
    $producten = Product::with(['allergenen', 'magazijn'])->orderBy('naam', 'asc')->get();
    $allergenen = Allergeen::all();
    $leveranciers = Leverancier::with('contact')->get(); // Zorg dat 'contact' correct is gedefinieerd

    return view('overzicht-allergenen', compact('producten', 'allergenen', 'leveranciers'));
    }

    public function filter(Request $request) {
        $allergeen_id = $request->input('allergeen');
    
        // Check of een allergeen is geselecteerd
        if (!empty($allergeen_id)) {
            $producten = Product::whereHas('allergenen', function ($query) use ($allergeen_id) {
                $query->where('allergenen.id', $allergeen_id); // ✅ FIX: Specifieer de tabelnaam
            })->orderBy('naam', 'asc')->get();
        } else {
            $producten = Product::with(['allergenen', 'magazijn'])->orderBy('naam', 'asc')->get();
        }
    
        $allergenen = Allergeen::all();
        $leveranciers = Leverancier::with('contact')->get();
    
        return view('overzicht-allergenen', compact('producten', 'allergenen', 'leveranciers'));

        $request->validate([
            'allergeen' => 'required|exists:allergenen,id',
        ]);


        try {
            // Code voor ophalen van producten en leveranciers
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Er is iets misgegaan.');
        }
        
        
    }
    
    }
    
    
