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