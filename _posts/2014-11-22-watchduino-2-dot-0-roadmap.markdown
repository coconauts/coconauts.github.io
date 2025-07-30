---
layout: post
title: "Watchduino 2.0 roadmap"
date: 2014-11-22 19:52:37 +0000
comments: true
categories: hardware
tags: arduino watchduino
published: true
sharing: true
keywords: smartwatch,android,arduino
description: "Smartwatch roadmap"
---

<img src="/images/posts/watchduino-roadmap/components.jpeg" />

It's been some time since we gave you some updates about Watchduino,
but we haven't forgotten about the project. In fact, we can't stop
planning what will be the next exciting feature that we want to try to 
develop. For this reason, we've put together a roadmap of the set of
features we want the next version of Watchduino to include:

<!--more-->

Watchduino 2.0 roadmap:

- Bluetooth communication between Watchduino and Android phones
    - Android phone refers all notifications to Watchduino
    - Watchduino to show notifications
    - Dismiss notifications from Watchduino, they will be dismissed from phone as well
    - Ping utility to check connection
    - Time sync from phone
    - Once Bluetooth is working, more exciting features will come!
- Vibration
    - Vibrate with notifications and alarms
    - Can be disabled through options
- Better screen
    - Choose a better screen with more resolution. And perhaps even colors?
    - Current candidates:
	- 0.9'' 128x64 B&W OLED display
	- 1.8'' 128x160 color TFT display
- Better speaker
- Better design
    - Integrated PCB (more compact design)
    - 3D printed case?
- Programming framework improvements

In essence, we would like to make Watchduino as useful as other commercial
smartwatches. We have in fact already started to work on some of this. For instance...

<img src="/images/posts/watchduino-roadmap/notifications-bluetooth.jpeg" />

We are already able to refer Android notifications to Watchduino via Bluetooth.

<img src="/images/posts/watchduino-roadmap/bluetooth.jpeg" />

We have a prototype management Android app to aid with testing and setting up the
Bluetooth connection.

<img src="/images/posts/watchduino-roadmap/screens.jpg" />

An we've also started tinkering with new screen models.

To make all of this possible, we first invested some effort in doing a huge memory
optimization to the code, that gives us a lot more room for programming customizations.

We are also planning to do a little bit of research in the following areas, 
though some of these may turn out to be unachievable for Watchduino's requirements:

- Wireless charging
    - Watchduino to integrate a wireless charging receiver module, instead of USB port
    - This opens the door to having a water proof case
- Memory extension
    - Integrate a 23K256 SRAM module
- Voice control
- Touchscreen

So keep an eye on the blog, as we will be posting advancements and interesting results
as we go through the development of the features. Each step will bring us closer to
the ultimate hacker smartwatch!