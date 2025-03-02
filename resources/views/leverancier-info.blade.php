@extends('layouts.app')

@section('content')
    <h1>Overzicht Leverancier Gegevens</h1>
    @if($leverancier)
        <table>
            <tr>
                <th>Naam Leverancier</th>
                <th>Contactpersoon</th>
                <th>Mobiel</th>
                <th>Adres</th>
            </tr>
            <tr>
                <td>{{ $leverancier->naam }}</td>
                <td>{{ $leverancier->contact_persoon }}</td>
                <td>{{ $leverancier->mobiel }}</td>
                <td>{{ $leverancier->adres ?? 'Er zijn geen adresgegevens bekend' }}</td>
            </tr>
        </table>
    @else
        <p>Er zijn geen adresgegevens bekend.</p>
    @endif
@endsection
