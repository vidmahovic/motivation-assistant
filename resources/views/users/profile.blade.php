@extends('app')

@section('content')

<div class="col-md-9">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="http://www.bestcollegesonline.com/wp-content/uploads/2012/06/oldschoolsubjects2.jpg">
        </div>
        <div class="card-info"> <span class="card-title">{{$user->ime}} {{$user->priimek}}</span>

        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">Podatki</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="tasks" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
                <div class="hidden-xs">Zadolžitve</div>
            </button>
        </div>        
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
                <div class="hidden-xs">Statistika</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab4" data-toggle="tab"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                <div class="hidden-xs">Dnevnik aktivnosti</div>
            </button>
        </div>
    </div>

    <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
            @include('users.navbars.about')
        </div>
        <div class="tab-pane fade in" id="tab2">
            @include('users.navbars.tasklist')
        </div>
        <div class="tab-pane fade in" id="tab3">
            @include('users.navbars.stats')
        </div>
        <div class="tab-pane fade in" id="tab4">
            @include('users.navbars.activitylog')
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
