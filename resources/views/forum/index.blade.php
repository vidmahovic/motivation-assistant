@extends('app')

@section('content')

<div class="col-md-9">

<iframe width="100%" name="help" src="{!! $url !!}" scrolling="no" frameborder="0" onload='javascript:resizeIframe(this);'></iframe>

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

/*    $('#forumNavs').bind('show', function(e) {  

        // identify the tab-pane
        paneID = $(e.target).attr('href');

        // get the value of the custom data attribute to use as the iframe source
        src = $(paneID).attr('data-src');

        //if the iframe on the selected tab-pane hasn't been loaded yet...
        if($(paneID+" iframe").attr("src")=="")
        {
            // update the iframe src attribute using the custom data-attribute value
            $(paneID+" iframe").attr("src",src);
        }
    });
*/    </script>
@stop