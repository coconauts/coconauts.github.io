---
layout: post
title: "Smartwatch prototype with ESP8266: ESPmartwatch"
date: 2016-06-13 20:51:00 +0000
comments: true
tags: esp8266 smartwatch
sharing: true
categories: hardware
keywords: esp8266,websockets,wifi,oled,screen,smartwatch,arduino,bluetooth
description: "Smartwatch prototype with ESP8266 ESPmartwatch"
author: Javier Rengel
published: true
featured: true
---

It's been a while since we built and deprecated our [Watchduino 2](http://coconauts/projects/watchduino2) smartwatch built with Arduino and BLE technology. The reason why we stopped developing the prototype was because it was not as optimal as we expected, and the bluetooth communication was unstable in practice; this is probably something we could have solved with time, but we just decided it was not worth it.

![](https://photos.google.com/share/AF1QipOEfKO-t2YQuWrAs3JquDRCcmUcTJPXFBhZgx-xf4I0IaHE9-GfODI-dCLvhUBUSg/photo/AF1QipNlfph4kU3MMJHV-ioySjQdrdukdhoglP3bV7lh?key=Y0xneWNXRW04cnpUM0R3UTh6OTVZcWhrWFZmS0RR)

However, with the "new" ESP8266 we decided to try a quick prototype to see how it behaves as in a smartwatch, and we did a lot of things in just a couple of days, this are the list of features of our new  `ESPmartwatch`:

<!--more-->

* ESP8266 model ESP-01
* Wifi connection
* I2C OLED model SSD1306 128X64
* Send and receive messages via Websockets
* All messages are using JSON (being parsed on C++ too)
* Sync time and display on screen
* Display notifications from phone on screen using [Notification webhook](https://github.com/rephus/notification-webhook)

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Doing web development with JSON and websockets in C++ on ESP8266, exciting! <a href="https://t.co/v2ZU4hNZO5">pic.twitter.com/v2ZU4hNZO5</a></p>&mdash; Javi Rengel (@rephus) <a href="https://twitter.com/rephus/status/772901218414891008">September 5, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

On the way, we faced a few unexpected issues that took us some time to fix (more than implementing communication with websockets) like the ESP8266 restarting itself every 5 mins because the WDT.

But still, a lot of things are left to do like:

* Reduced consumption by enabling deep sleep mode while using websockets
* Lack of GPIO pins on ESP-01, need to try with a different ESP model
* Better OLED SSD1306 screen controller, u8glib seems incompatible, maybe Adafruit ?
* A way to introduce SSID and passwords from the watch (input required)
* Secure communication on websockets

So at this point we decided that it was not worth to continue with the project, specially when just the new [ESP32 has been released](http://hackaday.com/2016/09/05/new-part-day-the-esp32-has-been-released/)

All our code is available on [Github](TODO) so if you want to continue our work, or look at how we use some of the libraries, give it a go.

Who knows, we might probably continue with the development at some point, so watch this space.
