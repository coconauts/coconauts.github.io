---
layout: post
title: "Game manager"
date: 2015-08-01 15:53:19 +0000
comments: true
categories: software
tags: games opensource emulators
sharing: true
keywords: games,emulators,opensource,manager,steam
description: "Opensource game manager app for your games and emulators"
author: Javier Rengel
featured: true
published: true
---

This project has been available for a long time as a opensource software in [github](https://github.com/coconauts/game-manager),
but we didn't do any official announcement or anything as we have been testing it and adding
more features.

Today we present a software for managing all your games and emulators in your computer.

<img src="/projects/game-manager/sim-city.png" />

<!--more-->

In the past we tried with software like XMBC Game collection,
but it takes ages to download all the covers and info from the games.
We also tried [MALA](http://malafe.net/) a [long time ago](/projects/game-manager/old-arcade.png),
and it was great, but a bit old and only available on Windows.
So we decided to build one in Node.js with a lot of features that we wanted.

## Features

* Multiplatform lightweight app built in node.js and sqlite
* Immediately list all your games without indexing or downloading anything
* Mark games as "In progress", "Finished" or "Favorite" for faster access
* Search by name
* Support keyboard controls
* Download info from the games in real time from [thegamesdb.net](http://thegamesdb.net/)
* Read covers and screens from disk
* Automatically download missing covers from Google
* Execute games from the app directly (you just need to set the exec argument)
* Works with everything (even MAME games, windows or scummvm )
* Open source
* Compact and simple design
* Record your gameplays

## Demo
<iframe width="100%" height="450" src="https://www.youtube.com/embed/3ThvGbx2ku4" frameborder="0" allowfullscreen></iframe>

## How to run

You have the full documentation in the [repo](https://github.com/coconauts/game-manager).

But as it's a Node.js application, as soon as you have node already installed in your machine
you only need to do:

    npm install && node app.js

Once it's running, open a browser `localhost:8888` and start adding your platforms

## Future plans

This application was the first thing we built in Node.js,
so the code can be improved as we have leart a lot about this language in the last few months.

The platform is quite useful and stable, but we can still work on new features like
customizable skins, online storage for gamestates, or even online gameplay so you can run your Game manager server
but play anywhere just like Sony or Steam do.

Just let us know what's your favorite feature and we will focus on that!
