---
layout: post
title: "Control energenie with Pebble"
date: 2017-02-15 10:42:19 +0000
comments: true
categories: software
tags: pebble energenie smartwatch
sharing: true
keywords: pebble,energenie,smartwatch
description: "Control energenie with Pebble smartwatch"
author: Javier Rengel
featured: false
published: true
---

Last year I got a cheap Pebble smartwatch
[just days before the company was sold to Fitbit](https://twitter.com/rephus/status/806522854699372546)

One of the reasons was to play with it building our custom apps,
so we built an app to control our Energenie sockets from the watch,
sending HTTP requests to a Raspberry PI with the official radio module from Energenie.

All you need, apart form the pebble is a Raspberry PI to send the radio signal from a REST API to a Energenie socket.
Check how to do it [on our previous post](http://coconauts.net/blog/2016/04/15/energinie-and-raspberry-pi-setup/)

You can see it in action [here](https://twitter.com/rephus/status/810630836697649152)

<!--more-->

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Turning on Christmas from my pebble watch app and energenie sockets. <a href="https://t.co/XvtuQGs6h0">pic.twitter.com/XvtuQGs6h0</a></p>&mdash; Javi Rengel (@rephus) <a href="https://twitter.com/rephus/status/810630836697649152">December 18, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

The source code is availabe on [this repo](https://github.com/rephus/pebble-energenie)

We might try to build a game using the gyroscope in the future,
do you have any other ideas?
