---
layout: post
title: "Procedurally generated engine with websockets"
date: 2017-10-30 12:23:46 +0000
comments: true
categories: games
tags: websockets games nodejs 2d html5 cocos2d
sharing: true
keywords: websockets,games,nodejs,2d,html5,cocos
description: "Procedurally generated engine with websockets"
author: Javier Rengel
featured: true
published: true
---

We have been working for some time on an engine for cocos2d for 
persistent procedurally generated 2D worlds, for building a few ideas based on this concept, like a Zelda-like RPG multiplayer game.

![screenshot](/images/posts/2017-10-30-proc-websockets/sector-cocos.png)

The engine is built in NodeJS, and the server-client communication is fully implemented with websockets (using Socket.io), cocos2d in the frontend and built together with docker.

## Engine features 

* The client will only render the sectors around you, not the whole world.
* When the player discovers a new sector, the server will populate that sector (new discovered sectors apperars brighter to the user)
* The currenct sector will appear as red
* Supports multiplayer (you can see other players next to you)
* Random name generator for players
* Move the player using the keyboard, the camera will follow.

![description](/images/posts/2017-10-30-proc-websockets/sector-cocos-description.png)

## Try it out (docker)

If you want to use it for your own game, You can find the code on the repo https://github.com/rephus/proc-cocos and share your creation in the comments.

so all you need to run it is to install docker and then `docker-compose up`.

Open the client on a browser in http://localhost:8000

We may use this engine eventually to build our own game, stay tuned for more details.

