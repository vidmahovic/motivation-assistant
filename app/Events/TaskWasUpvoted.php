<?php

namespace App\Events;

use App\Events\Event;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class TaskWasUpvoted extends Event implements ShouldBroadcast
{
    use SerializesModels;

    public $user;
    public $task;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($userid, $taskid)
    {
        $this->user = \App\User::findOrFail($userid);
        $this->task = \App\Task::findOrFail($taskid);

    }

    /**
     * Get the channels the event should be broadcast on.
     *
     * @return array
     */
    public function broadcastOn()
    {
        return ['users-'.$this->task->userid];
    }
}
