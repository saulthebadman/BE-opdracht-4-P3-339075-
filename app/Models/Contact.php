<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model {
    use HasFactory;
    
    protected $table = 'contacten'; // Zorg dat dit overeenkomt met je database
    protected $fillable = ['straat', 'huisnummer', 'postcode', 'stad'];

    public function leverancier() {
        return $this->belongsTo(Leverancier::class, 'contact_id', 'id');
    }
}
