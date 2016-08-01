<?php

namespace App\Events;

use App\Events\Event;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Carbon\Carbon;

class PostWasVoted extends Event implements ShouldBroadcast
{
    use SerializesModels;

    public $user;
    public $post;
    public $vote;
    public $url;
    public $human_readable_datetime;

    /**
     * Create a new event instance.
     * Event fired in q2a/app/votes.php
     * @return void
     */
    public function __construct($userid, $postid, $vote, Carbon $datetime)
    {
        $this->user = \App\User::findOrFail($userid);
        $this->post = \App\Post::findOrFail($postid);

        if($vote == 1) {
            $this->vote = "pozitivno";
        } else {
            $this->vote = "negativno";
        }

        $this->url = $url;
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
