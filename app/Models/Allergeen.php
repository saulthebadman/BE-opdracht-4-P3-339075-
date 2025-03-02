<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Allergeen extends Model {
    use HasFactory;
    protected $table = 'allergenen'; // Zorg ervoor dat dit overeenkomt met je migratie
    protected $fillable = ['naam', 'omschrijving'];
}
