<?php

namespace App\Events;

use App\Events\Event;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;


class AnswerWasCreated extends Event implements ShouldBroadcast
{
    use SerializesModels;

    public $user;
    public $post;
    public $human_readable_datetime;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($userid, $postid)
    {
        $this->user = \App\User::findOrFail($userid);
        $this->post = \App\Post::findOrFail($postid);
        $this->human_readable_datetime = $this->post->created->diffForHumans();
    }

    /**
     * Get the channels the event should be broadcast on.
     *
     * @return array
     */
    public function broadcastOn()
    {
        $broadcast_to_userid = \App\Post::find($this->post->parentid)->userid;

        return ['user-'.$broadcast_to_userid];
    }
}
