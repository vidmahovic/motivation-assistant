
$(function(){

    // Storing some elements in variables for a cleaner code base

    var refreshButton = $('h1 img'),
        shoutboxForm = $('.shoutbox-form'),
        form = shoutboxForm.find('form'),
        closeForm = shoutboxForm.find('h2 span'),
        nameElement = form.find('#shoutbox-name'),
        commentElement = form.find('#shoutbox-comment'),
        ul = $('ul.shoutbox-content'),
        publishUrl = form.find('#route');

    // Replace :) with emoji icons:
    //emojione.ascii = true;


    // Toggle the visibility of the form.


    shoutboxForm.on('click', 'h2', function(e){

        if(form.is(':visible')) {
            formClose();
        }
        else {
            formOpen();
        }

    });


    function formOpen(){

        if(form.is(':visible')) return;

        form.slideDown();
        closeForm.fadeIn();
    }

    function formClose(){

        if(!form.is(':visible')) return;

        form.slideUp();
        closeForm.fadeOut();
    }


    // Clicking on the REPLY button writes the name of the person you want to reply to into the textbox.

    ul.on('click', '.shoutbox-comment-reply', function(e){

        var replyName = $(this).data('name');

        formOpen();
        commentElement.val('@'+replyName+' ').focus();

    });

});