---
layout: page
title: "WatchDuino"
comments: false
sidebar: true
sharing: true
footer: true
---

NOTE: We have a newer and sexier revision of Watchduino, including Bluetooth
connectivity, and a better look and feel. [Check it out!](https://www.coconauts.net/projects/watchduino2/)

<iframe width="770" height="480" src="//www.youtube.com/embed/CtgR1YiwnEY" frameborder="0" allowfullscreen></iframe>

WatchDuino is an open hardware project that combines inexpensive electronic components and a complex Arduino (C++) code to build a useful and reprogrammable smart watch.

The code and the components have been optimized after a lot of prototypes to provide a rich set of features with a small and cheap battery that can last more than a week without recharging. A lot of electronic and software engineering was required to make this project possible.

## Features
* Time and date (analog and digital output)
* Alarm / Countdown (with custom music)
* Games
* Pong (1 vs com)
* Snake
* Rechargeable battery (by USB)
* Battery meter
* Low-battery mode (it can last 2 years with 240mAh battery)
* Built-in screen light
* Compact design
* Framework-like architecture to easily program custom screens

## Main components

* ATMega 328
* Crystal oscillator (16Mhz)
* LiPo battery (240mAh)
* Nokia 5110 LCD screen

## Further reading

* [Project motivation](http://bitbucket.org/rephus/watchduino/src/master/docs/motivation.md) - Why we built WatchDuino, what does it offer to the world, and some technical musings.

* [How to replicate](http://bitbucket.org/rephus/watchduino/src/master/docs/how_to_replicate.md) - Components, libraries, and everything you need to build your own WatchDuino.

* [How to program](http://bitbucket.org/rephus/watchduino/src/master/docs/how_to_program.md) - Hack on WatchDuino’s software to make your own apps and customizations.
