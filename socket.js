var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var Redis = require('ioredis');
var oneSubscriber = new Redis();
var multipleSubscribers = new Redis();


var clients = {};

Redis.bebug_mode = true;

oneSubscriber.psubscribe('user-*', function(err, count) {
	console.log(err);
});

multipleSubscribers.subscribe('broadcast-channel', function(err, count) {
	console.log(err);
});

io.on('connection', function(socket) {
	socket.on('login', function(data) {
		console.log("Data on subscribe: "+data.userid+"\n");
		clients[data.user.userid] = socket.id;
	});
});

oneSubscriber.on('pmessage', function(subscribed, channel, message) {
  console.log('Client subscribed to channel: '+channel+"\n");
   console.log('Message Recieved: ' + message+ "\n");

    message = JSON.parse(message);

    // send to all including sender (parse id in client-side accordingly)
    io.emit(channel + ':' + message.event, message.data);

});

// receive 'message' from client and respond accordingly
multipleSubscribers.on('message', function(channel, message) {
  	console.log('Client subscribed to channel: '+channel);
	console.log('Message Recieved: ' + message+ "\n");

	message = JSON.parse(message);

	//console.log("Message: "+message.data.user.userid+"\n");
	//console.log("Clients: "+clients[message.data.user.userid]);
	// send to all escept the sender
	io.emit(channel + ':' + message.event, message.data);
});



http.listen(3000, function(){
    console.log('Listening on Port 3000');
});

io.set('origins', '*:*');