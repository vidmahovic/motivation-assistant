    <div class="container">
        <div class="row">
            <div class="col-md-12 personal-info">
                <?= var_dump($errors->all()) ?>
                {!! Form::open(['class' => 'form-horizontal', 'method' => 'PATCH', 'action' => ['UserController@update', $user->userid]]) !!}
                    {!! Form::hidden('userid', $user->userid) !!}
                    <input type="hidden" value="{{ $user->userid }}"> 
                    <div class="form-group">
                        {!! Form::label('ime', 'Ime:', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-5">
                            {!! Form::text('ime', $user->ime, ['class' => 'form-control']) !!}
                             @if($errors->has('ime'))
                              @foreach($errors->get('ime') as $error)
                                <small style="color: red;">{{ $error }}<br /></small>
                              @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('priimek', 'Priimek', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-5">
                            {!! Form::text('priimek', $user->priimek, ['class' => 'form-control']) !!}
                             @if($errors->has('priimek'))
                              @foreach($errors->get('priimek') as $error)
                                <small style="color: red;">{{ $error }}<br /></small>
                              @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('email', 'Elektronski naslov:', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-5">
                            {!! Form::text('email', $user->email, ['class' => 'form-control']) !!}
                             @if($errors->has('email'))
                              @foreach($errors->get('email') as $error)
                                <small style="color: red;">{{ $error }}<br /></small>
                              @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('rojstvo', 'Datum rojstva', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-5">
                            {!! Form::text('rojstvo', $user->rojstvo->format('d.m.Y'), ['class' => 'form-control']) !!}
                             @if($errors->has('rojstvo'))
                              @foreach($errors->get('rojstvo') as $error)
                                <small style="color: red;">{{ $error }}<br /></small>
                              @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('naziv', 'Naziv:', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-5">
                            {!! Form::text('naziv', $user->naziv, ['class' => 'form-control']) !!}
                             @if($errors->has('naziv'))
                              @foreach($errors->get('naziv') as $error)
                                <small style="color: red;">{{ $error }}<br /></small>
                              @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('izobrazba', 'Izobrazba:', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-5">
                            {!! Form::text('izobrazba', $user->izobrazba, ['class' => 'form-control']) !!}
                             @if($errors->has('izobrazba'))
                              @foreach($errors->get('izobrazba') as $error)
                                <small style="color: red;">{{ $error }}<br /></small>
                              @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('telefon', 'Telefon:', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-5">
                            {!! Form::text('telefon', $user->telefon, ['class' => 'form-control']) !!}
                             @if($errors->has('telefon'))
                              @foreach($errors->get('telefon') as $error)
                                <small style="color: red;">{{ $error }}<br /></small>
                              @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('hidenum,', 'Skrij mojo številko:', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-5">
                            {!! Form::checkbox('hidenum', null,  ['class' => 'checkbox'])!!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! Form::label('opis', 'Opis:', ['class' => 'col-md-3 control-label']) !!}
                        <div class="col-md-7">
                            {!! Form::textarea('opis', $user->opis, ['class' => 'form-control', 'rows' => '8', 'cols' => '20']) !!}
                             @if($errors->has('opis'))
                              @foreach($errors->get('opis') as $error)
                                <small style="color: red;">{{ $error }}<br /></small>
                              @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-7">
                            <input class="btn btn-success" value="Shrani spremembe" type="submit">
                            <input class="btn btn-default" value="Povrni vnose" type="reset" style="float: right;">
                        </div>
                    </div>
                {!! Form::close() !!}

            </div>
        </div>
    </div>