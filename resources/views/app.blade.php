<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Motivation Assistant</title>

    <!-- Styles -->
    <link rel="stylesheet" href="/assets/css/bootstrap.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/toastr.css">
    
	<!-- Fonts -->
	<link href='//fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' rel='stylesheet' type='text/css'>
    <link href="//fonts.googleapis.com/css?family=Lato:100" rel="stylesheet" type="text/css">

    <!-- Scripts -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>




    <!-- FOR AUTOMATIC ADJUSTMENT OF IFRAME  -->
    <script language="javascript" type="text/javascript">
        function resizeIframe(obj) {
        obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
        }
    </script>

</head>
<body>

    @if(isset($flash_message))
        <script>
            alert({{ $flash_message }});
        </script>
    @endif

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="{{ url('/') }}">Domov</a>
            </div>
            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav">
                    @if(! Auth::guest())
                    <li><a href="{{ url('users') }}">Uporabniki</a></li>
                    <li><a href="{{ url('hierarchy') }}">Hierarhija organizacije</a></li>
                    <li><a href="{{ url('forum') }}">Forum</a></li>
                    @else
                    <li><a href="http://www.fu.uni-lj.si/">Spletna stran fakultete</a></li>
                    <li><a href="https://estudent.fu.uni-lj.si/">E-Študent FU</a></li>
                    <li><a href="https://e-izobrazevanje.fu.uni-lj.si/">Spletna učilnica FU</a></li>
                    <li><a href="http://www.mizs.gov.si/">Ministrstvo za izobraževanje</a></li>
                    @endif            
                </ul>
                @if(! Auth::guest())
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Iskanje">
                        <button type="submit" class="btn btn-default">Išči</button>
                    </div>
                </form>
                @endif
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">O Nas</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="jumbotron" style="background-color:#428bca;">
        <div class="container">
            <h1 style="color:white;">Motivation assistant</h1>
            <p style="color:#c0c0c0;">Socialno omrežje Fakultete za upravo, namenjeno izboljševanju motivacije.</p>
        </div>
    </div>

	@yield('content')

    @if(!(Auth::guest()))


        <div class="col-md-3">
            <h3 style="text-align: center;">Pozdravljen, {{ Auth::user()->ime }}</h3>
            <div class="row text-center">
                <img src="{{ Auth::user()->slika }}" class="img-circle" style="width: 170px; height: 170px;"/>
            </div>
            <br/>
            <br/>
            <a href="{{ url('users/'.Auth::user()->userid) }}"><i class="glyphicon glyphicon-user"></i> Moj profil</a>
            <a href="{{ url('/auth/logout') }}" style="float: right;">Odjava <i class="glyphicon glyphicon-log-out"></i></a>
            <hr style="margin-top: 2px;"/>


            @include('partials.shoutbox')

        </div>

        <input type="hidden" value="{{ Auth::user()->userid }}" id="auth_id" />

    @endif



    <!-- Scripts -->
    <!--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>-->
    <!--<script src="{{ asset("/js/script.js") }}"></script>-->

    @yield('footer')
    @yield('scripts')



     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    {{-- <script src="https://cdn.socket.io/socket.io-1.3.5.js"></script> --}}
    <script src="{{ asset('assets/js/socket.io.js') }}"></script>
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="/assets/js/simply-toast.js"></script>

    {{-- <script src="https://cdn.socket.io/socket.io-1.3.4.js"></script> --}}

    <script>
        
        var socket = io('http://localhost:3000');


        
        // new answer was created by user message.user.id
        socket.on("user-"+ $('#auth_id').val() + ":App\\Events\\AnswerWasCreated", function(message){

            var notification = '<p>Oseba <a href="{!! url("users/'+String(message.user.userid)+'") !!}">'
                               +message.user.ime+' '+message.user.priimek+
                               '</a> je odgovorila na vaše <a href="{!! URL::action("ForumController@index", array("url" => '+message.url+')) !!}">vprašanje</a>.</p><small>'
                               +message.human_readable_datetime+
                               '</small>';

            var toastInstance = $.simplyToast(notification, 'success', {
                delay : 10000,
                maxWidth : 600                
            });

        });

        // new question was created by user message.user.id, broadcast to all except the author of the question
        socket.on("broadcast-channel:App\\Events\\QuestionWasCreated", function(message) {

            if($('#auth_id').val() != message.user.userid) {

                var notification = '<p>Oseba <a href="{!! url("users/'+String(message.user.userid)+'") !!}">'+message.user.ime+' '+message.user.priimek+'</a> je zastavila novo <a href="{!! URL::action("ForumController@index", array("url" => '+message.url+')) !!}">vprašanje</a>.</p><small>'+message.human_readable_datetime+'</small>';

                var toastInstance = $.simplyToast(notification, 'success', {
                    delay : 10000,
                    maxWidth : 600
                });
            }
        });

        // existing question OR answer was upvoted OR downvoted
        socket.on("user-"+ $('#auth_id').val() + ":App\\Events\\PostWasVoted", function(message) {

            switch(message.post.type) {
                

                case 'A':
                    var notification = '<p>Oseba <a href="{!! url("users/'+String(message.user.userid)+'") !!}">'+message.user.ime+' '+message.user.priimek+'</a> je '+message.vote+' glasovala na vaš <a href="{!! URL::action("ForumController@index", array("url" => '+message.url+')) !!}">odgovor</a>.</p>';
                   break;
                

                case 'Q':
                    var notification = '<p>Oseba <a href="{!! url("users/'+String(message.user.userid)+'") !!}">'+message.user.ime+' '+message.user.priimek+'</a> je '+message.vote+' glasovala na vaše <a href="{!! URL::action("ForumController@index", array("url" => '+message.url+')) !!}">vprašanje</a>.</p>';
                   break;
            }

            notication = notification+'<small>'+message.human_readable_datetime+'</small>';

            var toastInstance = $.simplyToast(notification, 'success', {
                delay : 10000,
                maxWidth : 600
            });
        });

        // question was closed for answers
        socket.on("user-"+$('#auth_id').val() + ":App\\Events\\QuestionWasClosedReopened", function(message) {

            var notification = '<p>Oseba <a href="{!! url("users/'+String(message.user.userid)+'") !!}">'+message.user.ime+' '+message.user.priimek+'</a> je zaprla vaše <a href="{!! URL::action("ForumController@index", array("url" => '+message.url+')) !!}">vprašanje</a>. Razlog: '+message.reason+'.</p>';

            var toastInstance = $.simplyToast(notification, 'success', {
                delay : 10000,
                maxWidth : 600
            });

        });

        // task was upvoted
        socket.on("user-"+$('#auth_id').val() + ":App\\Events\\QuestionWasClosedReopened", function(message) {

            var notification = '';

            var toastInstance = $.simplyToast(notification, 'info', {
                delay : 10000,
                maxWidth : 600
            });
        });

        //user was upvoted


    </script>
    

 

</body>
</html>
