<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductPerLeverancier extends Model {
    use HasFactory;
    protected $table = 'product_per_leverancier';
    protected $fillable = ['leverancier_id', 'product_id', 'datum_levering', 'aantal', 'datum_eerst_volgende_levering'];
}
