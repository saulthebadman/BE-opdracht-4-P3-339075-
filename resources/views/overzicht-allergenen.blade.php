@extends('layouts.app')

@section('content')
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid black;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .info-link {
        color: red;
        text-decoration: none;
        font-weight: bold;
    }
    .info-link:hover {
        text-decoration: underline;
    }
    .filter-section {
        margin-bottom: 20px;
    }
    select, button {
        padding: 5px;
        font-size: 16px;
    }
</style>

<h1>Overzicht Allergenen</h1>

<!-- ✅ Formulier voor filtering -->
<div class="filter-section">
    <form action="{{ route('filter.allergenen') }}" method="GET">
        <label for="allergeen">Filter op allergeen:</label>
        <select name="allergeen" id="allergeen">
            <option value="">-- Alle allergenen --</option>
            @foreach($allergenen as $allergeen)
                <option value="{{ $allergeen->id }}" {{ request('allergeen') == $allergeen->id ? 'selected' : '' }}>
                    {{ $allergeen->naam }}
                </option>
            @endforeach
        </select>
        <button type="submit">Maak Selectie</button>
    </form>
</div>

<!-- ✅ Tabel met producten en allergenen -->
<table>
    <tr>
        <th>Naam Product</th>
        <th>Naam Allergenen</th>
        <th>Omschrijving</th>
        <th>Aantal Aanwezig</th>
        <th>Info</th>
    </tr>
    @foreach($producten as $product)
        <tr>
            <td>{{ $product->naam }}</td>
            <td>
                @foreach($product->allergenen as $allergeen)
                    {{ $allergeen->naam }}<br>
                @endforeach
            </td>
            <td>
                @foreach($product->allergenen as $allergeen)
                    {{ $allergeen->omschrijving }}<br>
                @endforeach
            </td>
            <td>{{ $product->magazijn ? $product->magazijn->aantal_aanwezig : 'N/A' }}</td>
            <td><a href="#">❓</a></td>
        </tr>
    @endforeach
</table>

<!-- ✅ Tabel met leveranciers -->
<h1>Overzicht Leveranciers</h1>
<table>
    <tr>
        <th>Naam Leverancier</th>
        <th>Contactpersoon</th>
        <th>Mobiel</th>
        <th>Stad</th>
        <th>Straat</th>
        <th>Huisnummer</th>
    </tr>
    @foreach($leveranciers as $leverancier)
        <tr>
            <td>{{ $leverancier->naam }}</td>
            <td>{{ $leverancier->contact_persoon }}</td>
            <td>{{ $leverancier->mobiel }}</td>
            <td>{{ $leverancier->contact ? $leverancier->contact->stad : 'N/A' }}</td>
            <td>{{ $leverancier->contact ? $leverancier->contact->straat : 'N/A' }}</td>
            <td>{{ $leverancier->contact ? $leverancier->contact->huisnummer : 'N/A' }}</td>
        </tr>
    @endforeach
</table>
@endsection
