<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('naam');
            $table->string('barcode')->unique();
            $table->timestamps();
        });

        Schema::create('allergenen', function (Blueprint $table) {
            $table->id();
            $table->string('naam');
            $table->text('omschrijving')->nullable();
            $table->timestamps();
        });
        

        Schema::create('product_per_allergeen', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->foreignId('allergeen_id')->references('id')->on('allergenen')->onDelete('cascade');
            $table->timestamps();
        });
        
        

        Schema::create('leveranciers', function (Blueprint $table) {
            $table->id();
            $table->string('naam');
            $table->string('contact_persoon')->nullable();
            $table->string('leverancier_nummer')->unique();
            $table->string('mobiel')->nullable();
            $table->timestamps();
            $table->foreignId('contact_id')->nullable()->constrained('contacten')->onDelete('set null');

        });

        Schema::create('product_per_leverancier', function (Blueprint $table) {
            $table->id();
            $table->foreignId('leverancier_id')->constrained()->onDelete('cascade');
            $table->foreignId('product_id')->constrained()->onDelete('cascade');
            $table->date('datum_levering');
            $table->integer('aantal');
            $table->date('datum_eerst_volgende_levering')->nullable();
            $table->timestamps();
        });

        Schema::create('contacten', function (Blueprint $table) {
            $table->id();
            $table->string('straat');
            $table->string('huisnummer');
            $table->string('postcode');
            $table->string('stad');
            $table->timestamps();
        });

        Schema::create('magazijn', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained()->onDelete('cascade');
            $table->decimal('verpakkings_eenheid', 5, 2);
            $table->integer('aantal_aanwezig')->nullable();
            $table->timestamps();
        });
    }

    public function down() {
        Schema::dropIfExists('magazijn');
        Schema::dropIfExists('contacten');
        Schema::dropIfExists('product_per_leverancier');
        Schema::dropIfExists('leveranciers');
        Schema::dropIfExists('product_per_allergeen');
        Schema::dropIfExists('allergenen');
        Schema::dropIfExists('products');
    }
};
