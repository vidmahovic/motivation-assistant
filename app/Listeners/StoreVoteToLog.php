<?php

namespace App\Listeners;

use App\Events\PostWasVoted;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Services\LogService;
use App\Services\UserService;
use App\Services\PostService;


class StoreVoteToLog implements ShouldQueue
{

    public $log;
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
     * @param  PostWasVoted  $event
     * @return void
     */
    public function handle(PostWasVoted $event)
    {
        $attr['userid_aktiven'] = $event->user->userid;
        $attr['userid_pasiven'] = $event->post->userid;
        $attr['postid'] = $event->post->postid;
        $attr['type'] = 'vote';
        $attr['url'] = 'http://'.$_SERVER['HTTP_HOST'].'/question2answer/index.php?qa='.$attr['postid'].'&qa_1='.str_slug($event->post->title);

        $this->logger->storeForumLog($attr);
    }
}
