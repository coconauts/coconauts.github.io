---
layout: page
title: "Small hardware projects"
comments: false
sidebar: true
sharing: false
footer: true
---

This is a list of small hardware projects we have done.

For bigger projects look at:

* [Watchduino](/projects/watchduino)
* [Watchduino 2](/projects/watchduino2)

For all posts about projects go to [all hardware posts](/posts/categories/hardware)

## Energenie

Energenie sockets are great for building a smart home.
These cheap devices that allows you can turn on/off power sockets with a simple remote,
a Raspberry PI or even an Arduino/ESP8266 and a cheap radio module.

<img src="https://c2.staticflickr.com/2/1545/25845471424_d600499717_d.jpg" class="screenshot" />

### Related posts

* [Build a Smart Home Using Raspberry Pi and Energenie](http://coconauts.net/blog/2016/04/15/energinie-and-raspberry-pi-setup/)
* [Control Energenie With Pebble](http://coconauts.net/blog/2017/02/15/control-energenie-with-pebble/)

## Smart staircase lights

For a long time, we’ve been turning on the lights at the beginning the staircase, just to turn them off when we reach another floor.

But instead, we built a simple system to turn them ON automatically when you are going upstairs or downstairs, just by using a couple of IR proximity sensors, a relay and an Arduino Pro Mini, to control the timing.

Featured on [Instructables](https://www.instructables.com/id/Smart-Staircase-LED-Lighting/) !!

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Smart staircase LED lighting with <a href="https://twitter.com/hashtag/Arduino?src=hash">#Arduino</a> and IR sensors <a href="https://t.co/ns5zh2r8tQ">pic.twitter.com/ns5zh2r8tQ</a></p>&mdash; Javi Rengel (@rephus) <a href="https://twitter.com/rephus/status/830460205699854336">February 11, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### Related posts

* [Smart Staircase LED Lighting With Arduino and IR Sensors](http://coconauts.net/blog/2017/02/21/stair-lights/)

## Lightning-dodge-O-matic

We hooked up a light-dependent resistor to an Arduino and rubber-banded a servo to press the X button for us on the lightning-dodge minigame on Final Fantasy X for PSVita.

<blockquote class="twitter-video" data-lang="en"><p lang="en" dir="ltr">Lightning dancing like a machine. Presenting lightning-dodge-O-matic <a href="https://twitter.com/hashtag/FFX?src=hash">#FFX</a> <a href="https://twitter.com/hashtag/Lulu?src=hash">#Lulu</a> <a href="https://twitter.com/hashtag/Arduino?src=hash">#Arduino</a> <a href="https://t.co/WMLX1CRwSN">pic.twitter.com/WMLX1CRwSN</a></p>&mdash; Javi Rengel (@rephus) <a href="https://twitter.com/rephus/status/742057060456648709">June 12, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### Related posts

* [Lightning-dodge-O-matic](http://coconauts.net/blog/2016/06/13/lightning-dodge-o-matic/)


## Light sensor

<img src="/projects/hardware/light-sensor.jpg" class="screenshot" />

Light sensor is an Arduino project with a radio module that sends a message
everytime a circuit is closed, or a button is pressed.

We use it to monitor if we left the light at the bathroom on and we're not at home.

### Related posts

* [Send readings from arduino to android via Radio](http://www.coconauts.net/blog/2014/09/03/send-readings-from-arduino-to-raspberry-via-radio/)
* [Arduino and radio improvements](/blog/2014/10/18/arduino-radio-improvements-low-consumption/)

## Door sensor

<img src="/projects/hardware/door-sensor.jpg" class="screenshot" />

Door sensor is an Arduino project with a radio module that sends a message
with light levels at the room.

We use it to monitor if the main door at home is open.

### Related posts

* [Send readings from arduino to android via Radio](http://www.coconauts.net/blog/2014/09/03/send-readings-from-arduino-to-raspberry-via-radio/)
* [Arduino and radio improvements](/blog/2014/10/18/arduino-radio-improvements-low-consumption/)

## Meteorological station and automatic watering with Raspberry PI

<img src="/projects/hardware/weather.jpg" class="screenshot" />

Meteorological station built with a Raspberry PI, a bunch of sensors and a water pump for automatic watering.

If the soil humidity gets below a specific value, the water pump will provide some water to the plants.

### Related posts

* [Meteorological station with Raspberry PI phase 1](/blog/2014/08/14/meteorological-station-with-rasbperry-pi-phase-1/)

## Simple automatic watering system with Arduino

Simple automatic watering system with Arduino, a water pump and a sensor.

Switch between by frequency or humidity functions.

<img src="/projects/hardware/watering.jpg" class="screenshot" />

### Related posts

* [Simple automatic watering system with Arduino](/blog/2015/04/22/simple-automatic-watering-system-arduino/)

## Turret-pi

<img src="/projects/hardware/turret-pi.jpg" class="screenshot" />

Turret-pi is an attempt of building a Portal turret using a Raspberry PI,
a IR presence module, a vibrator and a portable speaker.

Everytime the turrent detects a presence, it will speak, shoot and vibrate like in the original game.

The implementation in Python was finished, but the final project was paused
waiting for a proper casing.

## Simplest wireless powered project

<img src="/projects/hardware/wireless.jpg" class="screenshot" />

Running an arduino sketch (blink) without any batteries using wireless charging.

## Arduino and android bluetooth demo

<iframe width="100%" height="450" src="//www.youtube.com/embed/B-lNE8wwka4" frameborder="0" allowfullscreen></iframe>

Simple comunication between Arduino and Android using Bluetooth.
It will feature an Arduino attached to a motor, that will be listening for speed values
over a Bluetooth channel. Depending on the speed value received, our Aduino program
will vary the the rotation speed of the motor accordingly.


On the other side of the Bluetooth channel, sending the speed values, will be an
Android app, that will feature a graphic interface with a slide to select the desired
values.

### Related posts

* [Android and Arduino Bluetooth HC-06](/blog/2015/01/06/android-arduino-bluetooth-hc-06/)
