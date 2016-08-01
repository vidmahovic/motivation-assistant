<?php

namespace App\Listeners;

use App\Events\TaskWasUpvoted;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Services\LogService;

class StoreTaskUpvoteToLog implements ShouldQueue
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
     * @param  TaskWasUpvoted  $event
     * @return void
     */
    public function handle(TaskWasUpvoted $event)
    {
        $attr['userid_aktiven'] = $event->user->userid;
        $attr['userid_pasiven'] = $event->task->userid;
        $attr['id_zadolzitve'] = $event->task->id_zadolzitve;
        $attr['type'] = 'endorse';

        $this->logger->storeAppLog($attr);
    }
}
