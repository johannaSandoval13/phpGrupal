@extends('layouts.app')

@section('estilos')
    <link href="{{ asset('css/nuevo.css') }}" rel="stylesheet">
@endsection

@section('content')

<div class="form-container">
<form action="{{route('occupation.store')}}" method="POST">
    @csrf
<input type="text" name="occupation_code", placeholder="occupation code">
<input type="text" name="occupation_name", placeholder="occupation name">
<input type="text" name="occupation_description", placeholder="description">
<input type="submit" name="send">
</form>
</div>
@endsection