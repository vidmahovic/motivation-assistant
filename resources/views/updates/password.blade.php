{!! Form::open(['class' => 'form-horizontal', 'method' => 'PATCH', 'action' => ['UserController@update', $user->userid]]) !!}
    {!! Form::hidden('userid', $user->userid) !!}
	<div class="form-group">
        {!! Form::label('password', 'Novo geslo:', ['class' => 'col-md-3 control-label']) !!}
        <div class="col-md-5">
        {!! Form::password('password', array('placeholder'=>'Vnesite novo geslo', 'class'=>'form-control' ) ) !!}
        </div>
    </div>
    <div class="form-group">
        {!! Form::label('password_repeat', 'Ponovi geslo:', ['class' => 'col-md-3 control-label']) !!}
        <div class="col-md-5">
            {!! Form::password('password_repeat', array('placeholder'=>'Ponovite geslo', 'class'=>'form-control' ) ) !!}
            @if($errors->has('password_repeat'))
              @foreach($errors->get('password_repeat') as $error)
                <small style="color: red;">{{ $error }}<br /></small>
              @endforeach
            @endif
        </div>
    </div>
    <div class="form-group">
	    <label class="col-md-3 control-label"></label>
	    <div class="col-md-7">
	        <input class="btn btn-primary" value="Shrani spremembe" type="submit">
	    </div>
	</div>
{!! Form::close() !!}