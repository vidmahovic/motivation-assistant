@extends('app')


@section('content')
<div class="col-md-9">

@if(count($new_logs))
<div class="panel panel-success">
  <div class="panel-heading">
    <h3 class="panel-title">Novosti</h3>
  </div>
  <div class="panel-body comment-panel">
  @foreach($new_logs as $new_log)
    <div class="comment">
	  @if($new_log->type == 'endorse')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$new_log->userid_aktiven) }}">{{ $new_log->activeUser()->first()->ime }} {{ $new_log->activeUser()->first()->priimek }}</a></span> <em>je vzpodbudila</em> vašo zadolžitev.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
          {{ $new_log->task()->first()->content }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $new_log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($new_log->type == 'user_endorse')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$new_log->userid_aktiven) }}">{{ $new_log->activeUser()->first()->ime }} {{ $new_log->activeUser()->first()->priimek }} </a></span>vas <em>je vzpodbudila</em>.
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $new_log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($new_log->type == 'question')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$new_log->userid_aktiven) }}">{{ $new_log->activeUser()->first()->ime }} {{ $new_log->activeUser()->first()->priimek }}</a></span><em> je zastavila </em>novo vprašanje.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
        {{ $new_log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$new_log->url) }}">Poglej objavo</a>
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $new_log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($new_log->type == 'answer')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$new_log->userid_aktiven) }}">{{ $new_log->activeUser()->first()->ime }} {{ $new_log->activeUser()->first()->priimek }}</a></span><em> je odgovorila </em>na vaše vprašanje.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
        	{{ $new_log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$new_log->url) }}">Poglej objavo</a>
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $new_log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($new_log->type == 'vote')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$new_log->userid_aktiven) }}">{{ $new_log->activeUser()->first()->ime }} {{ $new_log->activeUser()->first()->priimek }}</a></span><em> je ocenila </em>vašo objavo.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
          {{ $new_log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$new_log->url) }}">Poglej objavo</a>
            </div>
          </div> 
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $new_log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($new_log->type == 'closed')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$new_log->userid_aktiven) }}">{{ $new_log->activeUser()->first()->ime }} {{ $new_log->activeUser()->first()->priimek }}</a></span><em> je zaprla </em>vašo objavo.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
         	{{ $new_log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$new_log->url) }}">Poglej objavo</a>
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $new_log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @else
   	  <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$new_log->userid_aktiven) }}">{{ $new_log->activeUser()->first()->ime }} {{ $new_log->activeUser()->first()->priimek }}</a></span><em> je ponovno odprla </em>vašo objavo.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
          {{ $new_log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$new_log->url) }}">Poglej objavo</a>
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $new_log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @endif
    </div>
    @endforeach
  </div>
</div>


@endif


<div class="panel panel-danger">
  <div class="panel-heading">
    <h3 class="panel-title">Zgodovina</h3>
  </div>
  <div class="panel-body comment-panel">
  @foreach($logs as $log)
    <div class="comment">
	  @if($log->type == 'endorse')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$log->userid_aktiven) }}">{{ $log->activeUser()->first()->ime }} {{ $log->activeUser()->first()->priimek }}</a></span> <em>je vzpodbudila</em> vašo zadolžitev.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
          {{ $log->task()->first()->content }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($log->type == 'user_endorse')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$log->userid_aktiven) }}">{{ $log->activeUser()->first()->ime }} {{ $log->activeUser()->first()->priimek }} </a></span>vas <em>je vzpodbudila</em>.
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($log->type == 'question')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$log->userid_aktiven) }}">{{ $log->activeUser()->first()->ime }} {{ $log->activeUser()->first()->priimek }}</a></span><em> je zastavila </em>novo vprašanje.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
        {{ $log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$log->url) }}">Poglej objavo</a>
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($log->type == 'answer')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$log->userid_aktiven) }}">{{ $log->activeUser()->first()->ime }} {{ $log->activeUser()->first()->priimek }}</a></span><em> je odgovorila </em>na vaše vprašanje.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
        	{{ $log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$log->url) }}">Poglej objavo</a>
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($log->type == 'vote')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$log->userid_aktiven) }}">{{ $log->activeUser()->first()->ime }} {{ $log->activeUser()->first()->priimek }}</a></span><em> je ocenila </em>vašo objavo.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
          {{ $log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$log->url) }}">Poglej objavo</a>
            </div>
          </div> 
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @elseif($log->type == 'closed')
      <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$log->userid_aktiven) }}">{{ $log->activeUser()->first()->ime }} {{ $log->activeUser()->first()->priimek }}</a></span><em> je zaprla </em>vašo objavo.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
         	{{ $log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$log->url) }}">Poglej objavo</a>
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @else
   	  <div class="comment__heading">
        <p class="heading-text">
        	Oseba <span class="heading-text__exposed"><a href="{{ url('users/'.$log->userid_aktiven) }}">{{ $log->activeUser()->first()->ime }} {{ $log->activeUser()->first()->priimek }}</a></span><em> je ponovno odprla </em>vašo objavo.
      </div>
      <div class="comment__body">
        <p class="comment__body__text">
          {{ $log->post()->first()->title }}
        </p>  
      </div>
      <div class="comment__footer">
        <div class="row">
          <div class="col col-xs-8">
            <div class="action-bar">
              <a href="{{ url('forum/'.$log->url) }}">Poglej objavo</a>
            </div>
          </div>
          <div class="col col-xs-4">
            <div class="date pull-right">
              <p>{{ $log->user_log_timestamp->diffForHumans() }}</p>
            </div>
          </div>  
        </div>
      </div>
      @endif
    </div>
    @endforeach
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


