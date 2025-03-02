<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Magazijn extends Model {
    use HasFactory;
    
    protected $table = 'magazijn'; // Zorg dat de naam overeenkomt met de database
    protected $fillable = ['product_id', 'verpakkings_eenheid', 'aantal_aanwezig'];

    public function product() {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}
