<?php

namespace App\Listeners;

use App\Events\QuestionWasCreated;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Services\LogService;


class StoreQuestionToLog implements ShouldQueue
{

    protected $loger;

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
     * @param  QuestionWasCreated  $event
     * @return void
     */
    public function handle(QuestionWasCreated $event)
    {
        $attr['userid_aktiven'] = $event->user->toArray()['userid'];
        $attr['userid_pasiven'] = $event->post->toArray()['userid'];
        $attr['postid'] = $event->post->toArray()['postid'];
        $attr['type'] = 'question';
        $attr['url'] = 'http://'.$_SERVER['HTTP_HOST'].'/question2answer/index.php?qa='.$attr['postid'].'&qa_1='.str_slug($event->post->title);

        $this->logger->storeForumLog($attr);
    }

}
