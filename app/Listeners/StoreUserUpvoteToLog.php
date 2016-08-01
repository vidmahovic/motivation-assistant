<?php

namespace App\Listeners;

use App\Events\UserWasUpvoted;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class StoreUserUpvoteToLog implements ShouldQueue
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
     * @param  UserWasUpvoted  $event
     * @return void
     */
    public function handle(UserWasUpvoted $event)
    {
        $attr['userid_aktiven'] = $event->endorser->userid;
        $attr['userid_pasiven'] = $event->endorsed->userid;
        $attr['type'] = 'endorse';

        $this->logger->storeAppLog($attr);
    }
}
