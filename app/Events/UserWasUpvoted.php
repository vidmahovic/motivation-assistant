<?php

namespace App\Events;

use App\Events\Event;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class UserWasUpvoted extends Event
{
    use SerializesModels;

    public $endorser;
    public $endorsed;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($endorserid, $endorsedid)
    {
        $this->endorser = \App\User::find($endorserid);
        $this->endorsed = \App\User::find($endorsedid);
    }

    /**
     * Get the channels the event should be broadcast on.
     *
     * @return array
     */
    public function broadcastOn()
    {
        return ['user-'.$this->endorsed->userid];
    }
}
