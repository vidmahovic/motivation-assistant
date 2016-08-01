<!-- TUKAJ MORAŠ VLEČI SAMO TASKE, KJER JE due_to >= Carbon::now(), POTEM PA JIH OBARVAŠ S PRIMERNO BARVO -->

@if(! $tasks->isEmpty())
@foreach($tasks as $task)
{{-- <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4"> --}}
<!--<div class="">-->
<div class="row">
<!-- Card Projects -->
<!--<div class="col-md-6 col-md-offset-3">-->
<div clas="col-xs-12 col-sm-12 col-md-4 col-lg-4">
<div class="cardm" style="margin: 8px;">
<!-- <div class="card-image">
<img class="img-responsive" src="http://material-design.storage.googleapis.com/publish/v_2/material_ext_publish/0Bx4BSt6jniD7TDlCYzRROE84YWM/materialdesign_introduction.png">
<span class="card-title">Material Cards</span>
</div>
-->
<div class="card-content">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<div class="text-left"><h4>{{ $task->content }}</h4></div>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<div class="row">
		<div class="col-xs-6">
			<div class="text-left"><h5><strong>Dodano:</strong> {{ $task->created_at->diffForHumans() }}</h5></div>			
		</div>
		<div class="col-xs-6">
			<div class="text-right"><h5><strong>{{ $task->st_glasov }} </strong> <i class="glyphicon glyphicon-thumbs-up"></i></h5></div>
		</div>
	</div>
</div>
</div>
</div>
<div class="card-action">
	<div class="row">
		<div class="col-xs-6">
			@if($task->userid == Auth::user()->userid)
			{!! Form::open(['method' => 'GET', 'action' => array('TaskController@edit', $task->id_zadolzitve)]) !!}
				<a href="" type="button" data-original-title="uredi zadolzitev" data-toggle="tooltip">{!! Form::button('<i class="glyphicon glyphicon-edit"></i>', array('type' => 'submit', 'class' => 'btn btn-sm btn-warning')) !!}</a>
			{!! Form::close() !!}
			@endif
		</div>
		<div class="col-xs-6">
			<span class="pull-right">
				@if($task->userid == Auth::user()->userid)
					{!! Form::open(['method' => 'DELETE', 'action' => array('TaskController@destroy', $task->id_zadolzitve)]) !!}
						<a href="" type="button" data-original-title="zbrisi zadolzitev" data-toggle="tooltip">{!! Form::button('<i class="glyphicon glyphicon-remove"></i>', array('type' => 'submit', 'class' => 'btn btn-sm btn-danger')) !!}</a>
					{!! Form::close() !!}
				@else
					{!! Form::open(['method' => 'PATCH', 'action' => ['TaskController@update', $task->id_zadolzitve]]) !!}
						<a type="button" data-original-title="upvote" data-toggle="tooltip">
							{!! Form::hidden('upvote', true) !!}
							{!! Form::button('<i class="glyphicon glyphicon-thumbs-up"></i>', array('type' => 'submit', 'class' => 'btn btn-sm btn-default')) !!}
						</a>
					{!! Form::close() !!}
				@endif
			</span>
		</div>
	</div>
</div>
</div>
</div>
</div>
{{-- </div> --}}
@endforeach
@else
{{-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"> --}}
<div class="spacing-lg"></div>
<h1 class="text-center">Uporabnik ni dodal še nobene zadolžitve :(</h1>
@if($user->userid == Auth::user()->userid)
	<div class="spacing-lg"></div>
	<h3 class="text-center">{!! Html::linkAction('TaskUserController@create', 'Ustvari novo zadolžitev', array($user->userid), array()) !!}</h3>
@endif
{{-- </div> --}}
@endif