@extends('app')

@section('content')
<div class="col-md-4"></div>
<div class="col-md-4">
    </br></br></br><h2>Prosimo, prijavite se</h2>

    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <strong>Ojoj! </strong>Nekaj je narobe z vašim vnosom<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form class="form-group" action="{{ url('/auth/login') }}" method="post">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <div class="form-group">
            <label class="sr-only" for="email">Email naslov</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="Email naslov" value="{{ old('email') }}">
            <label class="sr-only" for="password">Geslo</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Geslo">
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="remember">Zapomni si me</input>
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Vpiši me</button>
        <a class="btn btn-link" href="{{ url('/password/email') }}">Ste pozabili geslo?</a>
    </form>
</div>
<div class="col-md-4"></div>
@endsection
