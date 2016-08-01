@extends('app')

@section('content')
    <div class="col-md-4"></div>
    <div class="col-md-4">
        </br></br></br><h2>Ponastavitev gesla</h2>
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

        <form class="form-group" action="{{ url('/password/email') }}" method="post">
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <label class="sr-only" for="email">Email naslov</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="Email naslov" value="{{ old('email') }}">
            <br/>
            <button type="submit" class="btn btn-primary">Pošlji povezavo za ponastavitev gesla</button>
        </form>


<!--<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="panel-heading">Reset Password</div>
				<div class="panel-body">
					@if (session('status'))
						<div class="alert alert-success">
							{{ session('status') }}
						</div>
					@endif

					@if (count($errors) > 0)
						<div class="alert alert-danger">
							<strong>Ojoj</strong> Nekaj je narobe z vašim vnosom<br><br>
							<ul>
								@foreach ($errors->all() as $error)
									<li>{{ $error }}</li>
								@endforeach
							</ul>
						</div>
					@endif

					<form class="form-horizontal" role="form" method="POST" action="{{ url('/password/email') }}">
						<input type="hidden" name="_token" value="{{ csrf_token() }}">

						<div class="form-group">
							<label class="col-md-4 control-label">E-Mail Address</label>
							<div class="col-md-6">
								<input type="email" class="form-control" name="email" value="{{ old('email') }}">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-6 col-md-offset-4">
								<button type="submit" class="btn btn-primary">
									Send Password Reset Link
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
-->
@endsection
