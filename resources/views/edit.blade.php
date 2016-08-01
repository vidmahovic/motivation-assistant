@extends('app')

@section('content')

    <div class="col-md-9">
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">Osebni podatki</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="tasks" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                <div class="hidden-xs">Sprememba gesla</div>
            </button>
        </div>
    </div>

    <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
            @include('updates.profile')
        </div>
        <div class="tab-pane fade in" id="tab2">
            @include('updates.password')
        </div>
      </div>
    </div>


    </div>
@stop

@section('footer')

    <script type="text/javascript">
    $(document).ready(function() {
        $(".btn-pref .btn").click(function () {
            $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
            // $(".tab").addClass("active"); // instead of this do the below 
            $(this).removeClass("btn-default").addClass("btn-primary");   
        });
    });
    </script>
@stop