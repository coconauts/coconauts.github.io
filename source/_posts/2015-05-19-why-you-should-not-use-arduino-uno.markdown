---
layout: post
title: "Why you shouldn't use Arduino UNO"
date: 2015-05-18 21:53:19 +0000
comments: true
categories: hardware
tags: arduino uno
sharing: true
keywords: arduino,hardware,uno,nano,mini,lilypad,development,atmega328
description: "Why you shouldn't use Arduino UNO"
author: Javier Rengel
featured: false
published: true
---

Arduino is an awesome platform, that allows you to create almost
everything you can imagine with a really tiny investment and some
basic hardware knowledge.

Everyone starts using Arduino UNO for development, and we see
*a lot* of projects using this board, but there are a few good
reasons why you shouldn't use UNO...

<img src="/images/posts/why-not-uno/arduino_hand.jpg" />

<!--more-->

## Arduino UNO is expensive

Arduino UNO is one of the most expensive boards that features the
ATMega328 compared with other Arduino models like Mini, Micro,
or Lilypad. There are
[tons of them to choose from](http://www.arduino.cc/en/Main/Products))!

| Model       | Price (on store.arduino.cc) |
| ----------- | --------------------------- |
| UNO         | 20€
| Micro       | 18€
| Mini        | 14€
| Lillypad    | 16€


Note that these prices come from the
[oficial Arduino store](http://store.arduino.cc). However you can
easily find compatible clonic boards on Amazon, Ebay or Aliexpress,
at a fraction of the price.

You could also use a bare ATMega328 like we did in our
[first Watchduino](https://www.coconauts.net/projects/watchduino/)
or in our
[light sensor with RF24 radio module](https://www.coconauts.net/blog/2014/10/18/arduino-radio-improvements-low-consumption/).

## Arduino UNO is big

Arduino UNO is a big board, and you probably going to use a bread board
next to it, which makes your whole development prototype really complex.

Instead of that, use a Nano or Micro attached to a bread board directly.

<img src="/images/posts/why-not-uno/uno_vs_nano.jpeg" />

## Arduino UNO is not power-efficient

Most of the projects built with Arduino will be wireless and
battery-powered, so the device should be power-efficient,
but Arduino UNO is not.

Because Arduino UNO has a lot of hardware you don't need, it consumes
*a lot* more than its brothers:

* USB controller
* Too many leds

However, boards like Lilypad or Mini don't have a USB controller,
which reduces its normal consumption a few mAh, eg:

- Standalone consumption for UNO: 28mAh
- Standalone consumption for Mini: 13mAh

This measures have been taken when running a dummy sketch
that does nothing (not even blinking a LED). If you make
heavier computations or put the Arduino to sleep, measurements
will vary.

## Arduino UNO uses USB-B connector

Seriously?? in this day and age?

## Arduino UNO is not designed for production

Because it's big, and has a very high consumption, you shouldn't
ever use it in a prototype, like a remote controlled device, or a
batery-powered-sensor, or a
 [smartwatch](https://www.coconauts.net/projects/watchduino2/).

Also, you probably don't want to develop in a hardware that won't
match the final product specs, do you ?

## Conclussions

The only reason why you could want to use UNO is to use a shield,
but in most of the cases they're not worth it.

Our personal preference is Arduino Mini: it's small, cheap and has
the lowest consumption in its family.

So do yourself a favor and use any of the other boards available
instead of using UNO again.

<img src="/images/posts/why-not-uno/arduino_family.jpg" />
