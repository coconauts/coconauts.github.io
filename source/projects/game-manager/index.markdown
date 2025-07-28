---
layout: page
title: "Game Manager"
comments: false
sidebar: true
sharing: true
footer: true
---

## Description

<img src="/projects/game-manager/sim-city.png"  />

Web game manager is a “desktop” app built with node.js for indexing your list of videogames and roms. You just need to specify your emulator commands and your local folder with games and snaps to access them immediately.

<img src="/projects/game-manager/settings.png" class="screenshot" />
<img src="/projects/game-manager/zelda.png" class="screenshot" />
<img src="/projects/game-manager/mario-emulator.png" class="screenshot" />

In the past we tried with software like XMBC Game collection,
but it takes ages to download all the covers and info from the games.
We also tried [MALA](http://malafe.net/) a [long time ago](/images/posts/game-manager/old-arcade.png),
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
* Execute games from the app directly (you just need to set the exec command)
* Works with everything (even MAME games, windows or scummvm )
* Open source
* Compact and simple design
* Playing stats

## Demo

Version 2

<iframe width="100%" height="450" src="https://www.youtube.com/embed/3ThvGbx2ku4" frameborder="0" allowfullscreen></iframe>

Version 1

<iframe width="100%" height="450" src="//www.youtube.com/embed/54lXxtYDMrQ" frameborder="0" allowfullscreen></iframe>

## Links

* Download and source code: https://github.com/coconauts/game-manager
