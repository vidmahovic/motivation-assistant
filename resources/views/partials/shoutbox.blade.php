<link rel="stylesheet" href="/assets/css/shoutbox.css"/>
<div class="shoutbox">

    <h3 style="color: white; padding-left: 8px; background-color: #428bca; padding-top: 8px; padding-bottom: 8px; padding-right: 8px;">
        Shoutbox
        <img class="shoutbox" src='/assets/img/refresh.png' style="float: right; width: 20px; height: 20px; margin-top: 2px;"/>
    </h3>

    <ul class="shoutbox-content">
        @if(! $shouts->isEmpty())
            @foreach($shouts as $shout)
                 <span class="shoutbox-username">{{ $shout->user()->first()->ime }} {{ $shout->user()->first()->priimek }}</span>
                <p class="shoutbox-comment">{{ $shout->content }}</p>
                <div class="shoutbox-comment-details">
                    <span class="shoutbox-comment-reply" data-name="{{ $shout->user()->first()->ime }}">ODGOVORI</span>
                    <span class="shoutbox-comment-ago">{{ $shout->created_at->diffForHumans() }}</span>
                </div>
            @endforeach
        @else
            <p>Ni vzklikov</p>
        @endif
    </ul>

    <div class="shoutbox-form">
        <h2>Napišite sporočilo<span>×</span></h2>
        {!! Form::open(['action' => 'HomeController@store', 'method' => 'POST']) !!}
        {!! Form::textarea('content', "", ['id' => 'shoutbox-comment', 'maxlength' => '240']) !!}
        {!! Form::submit('Vzklikni!', ['id' => 'shout-submit']) !!}
        {!! Form::close() !!}
    </div>
</div>

<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="/assets/js/shoutbox.js"></script>




