---
layout: post
title: "Websocket vs REST"
date: 2017-11-20 14:14:46 +0000
comments: true
categories: software
tags: rest websocket api
sharing: true
keywords: architecture,rest,websocket,api,full,design
description: "Websocket vs REST api"
author: Javier Rengel
featured: false
published: true
---

We, as web backend software developers, have enoguh experience with RESTful APIs for web services, because they are clear, easy to implement, and scalable.

However, websockets are since some time ago becoming a viable alternative
for communicating between a web browser and a server. But what are good
usecases for them? Can the replace REST completely?

In this post we'll take a look at both architectures from their definitions to their implementations, and we will see which one is the best for building the future of web apps. 

<!--more-->

## What is a REST API ? 

A [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) API (Representational state transfer, application programming interface) is a simple set of rules for making communication on web applications over the Internet, and probably the most popular at the moment; in contrast with other approaches, like the older WSDL or [SOAP](https://en.wikipedia.org/wiki/SOAP) or the more recent [Protocol Buffers](https://en.wikipedia.org/wiki/Protocol_Buffers).

REST leans on the HTTP protocol a uses many of it's inherent features as part of the API structure.

### URL structure 
It defines the URL structure based on "resources" like `/resource/` or `/resource/id`. For example, if we provide users on our web interface, we might get a list of users if we hit `/user` endpoint, or retrieve an specific user by asking for his id `/user/1234`. This is in contrast to other approaches like SOAP which use a single endpoint for everything.

### HTTP methods 

The method defines the action to do on the URL previously mentioned, such as `GET`, `POST`, `PUT` or `DELETE`. For example, to get the information for the users, do you `GET /user`, this method doesn't have any other side effect. However, if you want to introduce a new user for your app, you will do `POST /user`, etc. 

![rest-example](/images/posts/2017-11-20-websocket-vs-rest/rest-example.png)

### Request and response 
 
For every request in HTTP, we always get back a response, even if the connection is unsuccessful, so you know which response is associated with the request you make. Another important part of the response is their response codes like 200 for OK or 404 error for Not found.

Although you can use XML or HTML on REST, the most common format is [JSON](https://en.wikipedia.org/wiki/JSON) for both the request and the response. Following our example from earlier, to add a user with some specific data, you might want to do  `POST /user { "name": 'Javier" }` and you will get back a response in the same format `{id: 1234, "name": "Javier"}` after it gets insterted into database with it's own unique ID.

The communication is always initialized from the client to the server, which will respond based on the request made. If you want to constantly fetch information (eg: get tweets on your timeline) you can use a technique called polling which consist in constantly make requests (like every 5 seconds or 1 minute) to get the updated data. 


Some solutions exist to overcome this, for example webhooks, in which you try to prevent polling by storing a callback url to call after an operation is complete (for example: [github webhooks](https://developer.github.com/v3/repos/hooks/) pinging your CI system).


## What is a Websocket ? 

> WebSocket is a computer communications protocol, providing full-duplex communication channels over a single TCP connection. [...] The WebSocket protocol enables interaction between a browser and a web server with lower overheads, facilitating real-time data transfer from and to the server. [Wikipedia](https://en.wikipedia.org/wiki/WebSocket)

If you're familiar with classic unix sockets, it's basically the same concept, translated to the web world.

Unlike REST, the communication is bidirectional, which means the server can send information to the client directly, as soon as the client creates the connection (called  handshake). For example, a client could query for a feed on tweets, and leave an open channel with the server. The server would then feed the client with new data as soon as it's available.

This offers some functionality that REST is unable to provide in an easy way. 

Because of this, the communication needs to be asynchronous, which needs to be taken into consideration when handling the responses.

## Differences between Websockets and REST

The first difference, is that they can't be compared directly: Websocket is a protocol, while REST is an architectural style. So in terms of comparing them, it would be fairer to compare WS to HTTP in general rather than REST (which which it shares many points regardless)

For the communication, you have resource based URLs and HTTP methods in REST, and for each request, you get a response. On websockets you just send plain string messages with the data you want to the server, and it will translate and process the data, and optionally one or many replies back.

![protocols](/images/posts/2017-11-20-websocket-vs-rest/protocols.png)

Websocket communication is a lot more efficient in terms of message size and speed than HTTP protocol, specially for large, repetitive messages. On HTTP you have to send the headers on every request (minimum of 2 bytes per message after initial request on websockets vs 8KB per request on HTTP) [Full benchmark](http://blog.arungupta.me/rest-vs-websocket-comparison-benchmarks/)

![websocket-graph](/images/posts/2017-11-20-websocket-vs-rest/websocket-graph.png)

Let's see an example of an HTTP request vs a websocket request. When using client libraries, they become quite similar for a simple use case.

#### Authenticating an user on REST

Fetch your user using a POST message with user and password (using [Request](https://developer.mozilla.org/en-US/docs/Web/API/Request) )


```
var myRequest = new Request('/user', {
    method: 'POST', 
    body: '{"name": "myname", "password": "mypassword"}'
});
fetch(myRequest).then(function(response) {
    if(response.status == 200) myUser = response.json();
    else throw new Error('Something went wrong on api server!');
})
```

#### Authenticating an user on Websocket

We'll try to do the same method on Websockets (using [Socket.io]](https://socket.io/docs/client-api/) library)

```
socket.emit("auth user", {"name": "myname", "password": "mypassword"})

socket.on("auth user response", function(user) {
    myUser = user;
})
```

The method `.emit` sends a JSON from the client to the server. The werver will then reply to that message that will be processed in the client on the `.on` method. 

### A real world example: Updating game player data

If we are building a multiplayer real time game, we will want to update the position of every player on everyone's game, which means one player (client) will have to send the new position to the server, and every client will have to update this player's position on their own game instance.

![websocket-diagram](/images/posts/2017-11-20-websocket-vs-rest/websocket-diagram.png)

This request won't be optimal using REST, specially on a fast paced real time game. The only option is to use the polling technique previously mentioned to fetch the status / position of all the players (or maybe filter by those recently updated) and make changes on them in the game. 

But websockets are particularly good on this kind of requests, as the server gets A notification from a client when it changes, the server can then send that status change back to the rest of the clients really fast.

```
// Client side player 1, on move send new position to the server
function move(position){ 
    socket.emit("update player", { "position": position }
}
// Client side other players, update other players 
socket.on("update player response", function(player) {
    otherPlayer.position = player.position; 
})

//Server side, update player and broadcast
socket.on('update player', function (data) {
    //console.log("update player ", data);
    players[socket.id].position = data; 
    socket.broadcast.emit('update player', players[socket.id]);
});
```

Also, the `.on` methods only get triggered when a message is sent from the server, so with no changes, no communication will be performed between client and server.

We used this approach on our latest [videogame prototype](http://coconauts.net/blog/2017/10/30/proc-websockets/).


## Conclussions 

A full Websocket API can replace a REST api, however it can't happen the other way around, as websockets offer realtime data stream that can't be implemented on REST (efficiently).

The asynchronous and undeterministic character of websockets, can lead to race conditions, when you make multiple requests. On the other hand, for every request in REST, you always get a single response.

The Internet at the moment is built on top of HTTP, like for example DNS, load balancing, security or even SEO analytics are not fully compatible with Websockets (yet). 
 
Another big difference is that while Websockets are stateful protocols, which means they create a connection that needs to live in the server until the socket is closed. HTTP connections are stateless, so they could be hitting different servers everytime and still work, which make them easier to scale horizontally.

Implementing a full Websocket API means reinventing similar standards already implemented on REST but with a different protocol, which might not be ideal.

So I'd still recommend to use REST for non real time data, because REST is the most popular architecture at the moment with loads of frameworks and tools, and it doesn't look like is going to change. But at least, it's fun to play with alternatives and most importantly, always pick the best tool for the job.

What do you think ? Have you ever tried to make a Websocket API instead of using REST ? let us know in the comments. 