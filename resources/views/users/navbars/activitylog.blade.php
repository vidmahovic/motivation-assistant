@if($logs->count())
  <div class="timeline">
  @foreach($logs as $log)

    @if($log->source == 'app') 
      <article class="timeline-item">
        <div class="timeline-desk">
            <div class="panel">
                <div class="panel-body">
                    <span class="arrow"></span>
                    <span class="timeline-icon red"></span>
                    <span class="timeline-date">{{$log->user_log_timestamp->format('d.m.Y')}}</span>
                    <h1 class="red">ob {{$log->user_log_timestamp->format('H:i')}}</h1>
                      @if ($log->type == 'endorse')
                        <p>Vzpodbudil zadolžitev <a href="{{ url('users/'.$log->userid_pasiven.'/tasks') }}">{{ $log->task()->first()->content }}</a> osebe <a href="{{ url('users/'.$log->userid_pasiven) }}">{{ $log->passiveUser()->first()->ime }} {{ $log->passiveUser()->first()->priimek }}</a>.</p>
                      @elseif ($log->type == 'user_endorse')
                        <p>Vzpodbudil osebo <a href="{{ url('users/'.$log->userid_pasiven) }}">{{ $log->first()->passiveUser()->first()->ime }} {{ $log->first()->passiveUser()->first()->priimek }}</a>.</p>
                      @endif
                </div>
            </div>
        </div>
      </article>
    @else
      <article class="timeline-item alt">
          <div class="timeline-desk">
              <div class="panel">
                  <div class="panel-body">
                      <span class="arrow-alt"></span>
                      <span class="timeline-icon green"></span>
                      <span class="timeline-date">{{$log->user_log_timestamp->format('d.m.Y')}}</span>
                      <h1 class="green">ob {{$log->user_log_timestamp->format('H:i')}}</h1>
                        @if($log->type == 'question')
                          <p>Zastavil <a href="{!! URL::action('ForumController@show', array('id' => $log->id)) !!}">novo vprašanje</a> v forumu.</p>
                        @elseif($log->type == 'answer')
                          <p>Odgovoril na <a href="{!! URL::action('ForumController@show', array('id' => $log->id)) !!}">vprašanje</a> osebe <a href="{{ url('users/'.$log->userid_pasiven) }}">{{ $log->first()->passiveUser()->first()->ime }} {{ $log->first()->passiveUser()->first()->priimek }}</a>.</p>
{{--                         @elseif ($log->type == 'vote')
                          @if($log->first()->post()->first()->type == 'A')
                            <p>Ocenil <a href="{!! URL::action('ForumController@show', array('id' => $log->id)) !!}">odgovor</a> osebe <a href="{{ url('users/'.$log->userid_pasiven) }}">{{ $log->first()->passiveUser()->first()->ime }} {{ $log->first()->passiveUser()->first()->priimek }}</a>.</p>
                          @else
                            <p>Ocenil <a href="{!! URL::action('ForumController@show', array('id' => $log->id)) !!}">vprašanje</a> osebe <a href="{{ url('users/'.$log->userid_pasiven) }}">{{ $log->first()->passiveUser()->first()->ime }} {{ $log->first()->passiveUser()->first()->priimek }}</a>.</p>
                          @endif --}}
                        @elseif ($log->type == 'closed')
                          <p>Zaprl <a href="{!! URL::action('ForumController@show', array('id' => $log->id)) !!}">vprašanje</a> osebe <a href="{{ url('users/'.$log->userid_pasiven) }}">{{ $log->first()->passiveUser()->first()->ime }} {{ $log->first()->passiveUser()->first()->priimek }}</a>.</p>
                          @break
                        @elseif ($log->type == 'reopened')
                          <p>Ponovno odprl <a href="{!! URL::action('ForumController@show', array('id' => $log->id)) !!}">vprašanje</a> osebe <a href="{{ url('users/'.$log->userid_pasiven) }}">{{ $log->first()->passiveUser()->first()->ime }} {{ $log->first()->passiveUser()->first()->priimek }}</a>.</p>
                        @endif
                  </div>
              </div>
          </div>
      </article>
    @endif
  @endforeach
  </div>
  <div class="clearfix">&nbsp;</div>
@else
  <div class="spacing-lg"></div>
  <h1 class="text-center">Zgodovina aktivnosti uporabnika je prazna :(</h1>
@endif
{{--                                       <article class="timeline-item">
                                          <div class="timeline-desk">
                                              <div class="panel">
                                                  <div class="panel-body">
                                                      <span class="arrow"></span>
                                                      <span class="timeline-icon blue"></span>
                                                      <span class="timeline-date">11:35 am</span>
                                                      <h1 class="blue">05 July | Monday</h1>
                                                      <p><a href="#">Anjelina Joli</a> added new album <span><a href="#" class="blue">PARTY TIME</a></span></p>
                                                      <div class="album">
                                                          <a href="#">
                                                              <img alt="" src="img/sm-img-1.jpg">
                                                          </a>
                                                          <a href="#">
                                                              <img alt="" src="img/sm-img-2.jpg">
                                                          </a>
                                                          <a href="#">
                                                              <img alt="" src="img/sm-img-3.jpg">
                                                          </a>
                                                          <a href="#">
                                                              <img alt="" src="img/sm-img-1.jpg">
                                                          </a>
                                                          <a href="#">
                                                              <img alt="" src="img/sm-img-2.jpg">
                                                          </a>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </article>
                                      <article class="timeline-item alt">
                                          <div class="timeline-desk">
                                              <div class="panel">
                                                  <div class="panel-body">
                                                      <span class="arrow-alt"></span>
                                                      <span class="timeline-icon purple"></span>
                                                      <span class="timeline-date">3:20 pm</span>
                                                      <h1 class="purple">29 June | Saturday</h1>
                                                      <p>Lorem ipsum dolor sit amet consiquest dio</p>
                                                      <div class="notification">
                                                          <i class=" fa fa-exclamation-sign"></i> New task added for <a href="#">Denial Collins</a>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </article>
                                      <article class="timeline-item">
                                          <div class="timeline-desk">
                                              <div class="panel">
                                                  <div class="panel-body">
                                                      <span class="arrow"></span>
                                                      <span class="timeline-icon light-green"></span>
                                                      <span class="timeline-date">07:49 pm</span>
                                                      <h1 class="light-green">10 June | Friday</h1>
                                                      <p><a href="#">Jonatha Smith</a> added new milestone <span><a href="#" class="light-green">prank</a></span> Lorem ipsum dolor sit amet consiquest dio</p>
                                                  </div>
                                              </div>
                                          </div>
                                      </article>
                                  </div>

                                  <div class="clearfix">&nbsp;</div> --}}