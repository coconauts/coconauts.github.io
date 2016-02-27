---
layout: post
title: "Watchduino 2 first prototype"
date: 2015-02-26 20:42:14 +0000
comments: true
categories: hardware
tags: arduino watchduino android smartwatch
sharing: true
keywords: arduino,watchduino,android,smartwatch
description: "Smartwatch prototype with arduino and android"
author: Javier Rengel
featured: true
---

Five weeks have passed since I built the first wearable prototype of Watchduino 2, 
and I would like to share with you my impressions, its current features and its possible improvements.

<img src="/images/posts/watchduino2-prototype/all-3.jpg" />

<!--more-->

## Software

The software is running in an Arduino Mini Pro v2 3.3v 8Mhz and spans across 1588 lines of code, 17 files and 9 different classes.

This code takes 28.212 bytes of the ATMega328's ROM and everything uses 1200 bytes of RAM when running. 

Apart from that, there is an Android app for comunication which provides cool features like a a Twitter client for our smartwatch.

## Hardware

We need to talk about new hardware for Watchduino 2,
as it is very different from its [first version](http://www.coconauts.net/projects/watchduino/) 
which makes this new version smaller, prettier and more useful.

* Arduino mini pro 2 8Mhz 3.3v
* LIPO battery 240mah
* 0.96" I2C 128X64 OLED (Various colors)
* 3 x 6 x 4.3mm Push Button 2 Pin
* 0.06A Micro Vibrator Motor
* Micro USB LIPO charger
* Bluetooth 3.0 module HC-06

We have built 2 (and a half) prototypes following the same specification.

## Features

Thanks to this new hardware, we managed to add new features to this new version. 
Most of them were mentioned in the [Watchduino roadmap post](http://www.coconauts.net/blog/2014/11/22/watchduino-2-dot-0-roadmap/), 
but you can have another look here:

### Companion app (Android)

<img src="/images/posts/watchduino2-prototype/manager.png" class="screenshot" />

This is a big one, thanks to the bluetooth module we are able to send and receive messages from and to Android
in realtime. This is a list of the features already available.

* Time sync: Set up the time sending a short message from the phone with the current timestamp, bye bye RTC.
* Weather information: Use weather APIs in the phone to get weather information (temperature, sky, humidity, etc)
* Twitter client: Read your twitter timeline from your watch (Awesome!!)

<img src="/images/posts/watchduino2-prototype/twitter.jpg" class="screenshot" />


* Notifications: Get notifications on your watch (emails, twits, whatsapp...) 
using the recent NotificationListener feature in Android.
* Debug: Great for debugging, send any message from the watch to your phone.
* Battery: Send battery messages from the watch to the phone to watch how the battery decreases with time 

<img src="/images/posts/watchduino2-prototype/battery.png" class="screenshot" />

But honestly, you can build whatever feature you want using your phone and a few APIs.
Facebook client maybe ? Automatic whatsapp responses ? 

Actually, we are working in the following features:

* Bus notifications (see how long does your bus take to arrive, using the Transport For London APIs)
* Settings: Managed from the android app, and stored in the phone.

### Screens

New screens, new resolution (128x64) and new style, with dynamic in-screen information for the buttons.

<img src="/images/posts/watchduino2-prototype/watch.jpg" class="screenshot"/>

Screen navigation is easier now with this simple menu.

<img src="/images/posts/watchduino2-prototype/menu.jpg" class="screenshot" />

### Notifications

A vibrator and a tiny buzzer will alert you when a notification arrives.

Also, the buzzer can play short melodies for alarms and whatnot.

### Battery life

Using a tiny 240mah battery and without any kind of energy optimization (on-screen, bluetooth always on) 
a single charge last around 10 hours.

Also, you can always look at your remaining battery in the top bar of the screen (like in phones).

The charging time is less than 20 minutes.

The problem here is the bluetooth module (HC-06), I was able to reduce its consumption to 4mA in sleep mode, 
but even so, the device would last up to 40 hours, which is not enough. 
No more optimisations can be performed from our side, 
so at this point I think the only option would be to try with [Bluetooth BLE](http://en.wikipedia.org/wiki/Bluetooth_low_energy).

## Possible improvements

It works cool so far, but it can be improved a lot (there are still a few bugs).
However that may require some time and maybe a new prototype.
In short term, this are the things we are going to focus in the next weeks.

* Better case (3D printed?).
* Fix missing characters from Watchduino to Android.
* New charging system.
* Improve Battery life with Bluetooth BLE.
* Save settings in Android.
* Bring back the alarm / countdown features from Watchduino v1.
* Memory ROM and RAM can be optimized.