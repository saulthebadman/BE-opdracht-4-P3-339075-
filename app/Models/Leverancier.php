<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Contact;



class Leverancier extends Model {
    use HasFactory;
    protected $fillable = ['naam', 'contact_persoon', 'leverancier_nummer', 'mobiel'];

    public function producten() {
        return $this->hasManyThrough(
            Product::class,
            ProductPerLeverancier::class,
            'leverancier_id',
            'id',
            'id',
            'product_id'
        );

        
    }
    public function contact() {
        return $this->hasOne(Contact::class, 'id', 'contact_id');
    }
    
    
}
