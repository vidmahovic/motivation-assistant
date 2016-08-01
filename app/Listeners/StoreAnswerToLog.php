<?php

namespace App\Listeners;

use App\Events\AnswerWasCreated;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class StoreAnswerToLog implements ShouldQueue
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
     * @param  AnswerWasCreated  $event
     * @return void
     */
    public function handle(AnswerWasCreated $event)
    {
        $question = \App\Post::find($event->post->toArray()['parentid']);

        $attr['userid_aktiven'] = $event->user->toArray()['userid'];
        $attr['userid_pasiven'] = $question->toArray()['userid'];        
        $attr['postid'] = $event->post->toArray()['parentid'];
        $attr['type'] = 'answer';

        $attr['url'] = 'http://'.$_SERVER['HTTP_HOST'].'/question2answer/index.php?qa='.$attr['parent'].'&qa_1='.str_slug($question->title);

        $this->logger->storeForumLog($attr);
    }

}
