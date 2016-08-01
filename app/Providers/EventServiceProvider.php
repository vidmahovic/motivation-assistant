<?php

namespace App\Providers;

use Illuminate\Contracts\Events\Dispatcher as DispatcherContract;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
    
        'App\Events\AnswerWasCreated' => [
            'App\Listeners\StoreAnswerToLog'
        ],

        'App\Events\QuestionWasCreated' => [
            'App\Listeners\StoreQuestionToLog'
        ],

        'App\Events\PostWasVoted' => [
            'App\Listeners\StoreVoteToLog',
        ],

        'App\Events\QuestionWasClosedReopened' => [
            'App\Listeners\StoreQuestionClosedReopenedToLog',
        ],
        'App\Events\TaskWasUpvoted' => [
            'App\Listeners\StoreTaskUpvoteToLog',
        ],
        'App\Events\UserWasUpvoted' => [
            'App\Listeners\StoreUserUpvoteToLog',
        ]
        
    ];

    /**
     * Register any other events for your application.
     *
     * @param  \Illuminate\Contracts\Events\Dispatcher  $events
     * @return void
     */
    public function boot(DispatcherContract $events)
    {
        parent::boot($events);

        //
    }
}
