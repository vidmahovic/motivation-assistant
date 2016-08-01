<?php

namespace App\Listeners;

use App\Events\QuestionWasClosedReopened;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class StoreQuestionClosedReopenedToLog
{
    protected $logger;
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(LogService $logger)
    {
        $this->logger = $logger;
    }

    /**
     * Handle the event.
     *
     * @param  QuestionWasClosedReopened  $event
     * @return void
     */
    public function handle(QuestionWasClosedReopened $event)
    {
        $attr['userid_aktiven'] = $event->post->closedbyid;
        $attr['userid_pasiven'] = $event->user->userid;
        $attr['postid'] = $event->post->postid;
        $attr['type'] = 'closed';

        $attr['url'] = 'http://'.$_SERVER['HTTP_HOST'].'/question2answer/index.php?qa='.$attr['postid'].'&qa_1='.str_slug($event->post->title);

        $this->logger->storeForumLog($attr);
    }

}
