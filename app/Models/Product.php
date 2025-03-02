<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model {
    use HasFactory;

    protected $fillable = ['naam', 'barcode'];

    public function allergenen() {
        return $this->belongsToMany(Allergeen::class, 'product_per_allergeen', 'product_id', 'allergeen_id');
    }

    public function magazijn() {
        return $this->hasOne(Magazijn::class, 'product_id', 'id');
    }
}
