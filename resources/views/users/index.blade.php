@extends('app')

@section('content')

    <div class="col-md-9">
    @if(! $users->isEmpty())
        @foreach($users as $user)
            <div class="col-md-3 col-sm-4 col-xs-6">
                <div class="card" style="margin-left: 0px; margin-top: 10px;">
                    <canvas class="header-bg" width="200" height="70" id="header-blur" style="background-color: white;"></canvas>
                    <div class="avatar">
                        <img src="{{ $user->slika }}" class="img-circle" style="width: 150px; height: 150px;" alt="Ni slike">
                    </div>
                    <div class="content" style="margin-top: 3px;">
                        @if($user->naziv)
                        <p style="color: white;">{{ $user->naziv }}</p>
                        @else
                            <br/>
                        @endif
                            <h4 style="color: white;">{{ $user->ime }} {{ $user->priimek }}
                        </h4>
                        <p>
                            <a href="{{ url('users/'.$user->userid) }}" class="btn btn-default">Profil</a>
                        </p>
                    </div>
                </div>
            </div>

        @endforeach
        <div class="clear"></div>
        <div class="col">
            <div class="col-xs-5"></div>
            <div class="col-xs-7">{!! $users->render() !!}</div>
        </div>
    @else
        <h1>Ni registriranih uporabnikov.</h1>
    @endif
    </div>
@endsection