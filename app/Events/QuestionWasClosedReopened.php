<?php

namespace App\Events;

use App\Events\Event;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class QuestionWasClosedReopened extends Event
{
    use SerializesModels;

    public $user;
    public $post;
    public $reason;
    public $mode;
    public $human_readable_datetime;


    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($questionid, $closedbyid, $reason, Carbon $datetime)
    {
        $this->user = \App\User::findOrFail($closedbyid);
        $this->post = \App\Post::findOrFail($questionid);
        $this->mode = "zaprla";

        $this->human_readable_datetime = $datetime->diffForHumans();
    }

    /**
     * Get the channels the event should be broadcast on.
     *
     * @return array
     */
    public function broadcastOn()
    {
        return ['user-'.$this->post->userid];
    }
}
