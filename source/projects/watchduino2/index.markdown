---
layout: page
title: "Watchduino 2"
comments: false
sidebar: true
sharing: true
footer: true
---

A smartwatch powered with Arduino, and a revision our previous [Watchduino project](http://www.coconauts.net/projects/watchduino/).

<img src="/projects/watchduino2/watch1.jpg" />

Featured in:

- [Atmel](http://blog.atmel.com/2015/09/02/tell-time-and-more-on-this-open-source-bluetooth-enabled-watch/)
- [MakerNews](http://makernews.info/featured/2015/09/watchduino-2-an-arduino-based-smartwatch-that-doesnt-look-like-a-bomb.html)
- Semifinalist in the [Hackaday Prize 2015](http://hackaday.com/2015/08/24/100-semifinalists-for-the-2015-hackaday-prize/)

The Watchduino project started as an attempt to build a smartwatch at the reach of everyone: inexpensive and open. So that anyone can afford one, or even build it from scratch. And at the same time, so that anyone can built their custom applications for it.

The [first version of Watchduino](http://www.coconauts.net/projects/watchduino/) was a very simple standalone device that featured time, alarms, and a couple of games. You could say that it was really more like a traditional "dumbwatch", except for the fact that the system was prepared to allow for custom user-programmed apps to be plugged in. On top of that, the total cost of the components to build one was around $10, and the battery life span was of months.

Since then, we've been working on version 2, which we intend to be as fully featured as a regular commercial smartwatch. By including a BLE into the watch, we are able to pair the device with an Android phone, and send and make notifications flow between the two. It is still a work in progress, but we already have a prototype with some of the functionality, that we are ready to show the world.

<img src="/projects/watchduino2/watch2.jpg" class="screenshot" />


## Software

The software is running in an Arduino Mini Pro v2 3.3v 8Mhz and spans across +1500 lines of code, 17 files and 9 different classes. This code takes 28.212 bytes of the ATMega328’s ROM and everything uses 1200 bytes of RAM when running.

Apart from that, there is an Android app for comunication which provides cool features like a a Twitter client for our smartwatch.


## Hardware

We changed most of the hardware from the first version, mostly with
the aim of trying to make the watch smaller. The current bill of materials is:

    Arduino mini pro 2 8Mhz 3.3v
    LIPO battery 240mah
    0.96” I2C 128X64 OLED (Various colors)
    3 x 6 x 4.3mm Push Button 2 Pin
    0.06A Micro Vibrator Motor
    Micro USB LIPO charger
    Bluetooth 4.0 BLE module HM-10

<img src="/projects/watchduino2/all-3.jpg" class="screenshot" />


# Features

As mentioned, Watchduino 2 is still a work in progress, but nevertheless, there are some features that we already have working in our prototype.

## Notifications from the phone

The best feature in Watchduino is the capability of sending notifications from your Android phone (just like all the proper smartwatches do). By using the Notification Listener Service we can redirect any notification to the watch via Bluetooth automagically (SMS, Emails, Whatsapp, Facebook, Google Now, calendars, etc). Then, once the notification arrives to the watch, you can just press a button to dismiss that notification in your phone too.

<img src="/projects/watchduino2/notifications.jpg" class="screenshot" />

## New bluetooth-based apps

The main improvement over the previous version is the BLE component, that allows it communicate with an Android phone. This is incredibly powerful, as effectively makes the phone become a "second brain" which is connected to the Internet, and can provide the watch with many useful data that was previously out of it's reach.

Thanks to the bluetooth pairing, we were able to build the following applications in the watch:

- time synchronization
- display phone notifications in the watch
- send battery status from watch to the phone, to make graphs
- watch twitter app (will show you the latest tweets from your timeline)
- watch weather app (will retrieve the weather in your location from http://forecast.io)
- watch TFL app (will tell you when the next buses/tubes will arrive based on your location in London).

The trick is that all of these apps also require an Android component in the Watchduino Android companion app, doing all the heavy lifting and simply passing Watchduino the results to display, via Bluetooth.

<img src="/projects/watchduino2/manager2.png" class="screenshot" />
<img src="/projects/watchduino2/battery.png" class="screenshot" />
<img src="/projects/watchduino2/buses.png.jpeg" class="screenshot" />


## New UI

Since we are using a different screen, with a better resolution (128x64), we were able to build a more flexible UI.

The top of the screen is showing a status bar, similar to what smartphones do. The 4 corners of the screen show contextual symbols that indicate what the purpose of the buttons is in every occasion. For instance, in the main menu you can move left and right, enter or exit.

<img src="/projects/watchduino2/menu2.jpg" class="screenshot" />

On an app, the functionality of the buttons can change. For instance, on the Twitter app you can request a reload, or navigate between tweets.

<img src="/projects/watchduino2/twitter.jpg" class="screenshot" />

# Can I see it in action?

Sure, here's a video showcasing the communication capabilities in the latest prototype:

<iframe width="560" height="315" src="https://www.youtube.com/embed/LVE85OxWGzs" frameborder="0" allowfullscreen></iframe>

The video shows both the watch and the android companion app (the new sexy Cordova redesign) working together. We first pair the application and then trigger some notifications both from the watch (when we enter the weather app for instance), or from the phone (using the testing buttons in the companion app to simulate a notification).

Turn on the subtitles for further explanations of what's going on at each point.

# Next challenges

There is still plenty to do! We have a working prototype with some cool apps, but there's much polishing until we can reach a product that actually usefull and nice to use in your everyday life:

- We need to polish the code, and specially the app-building framework. The purpose is to make it easy for anyone to write and integrate new apps.
- We need to improve battery life. Currently Watchduino 2 is able to run for 18 hours after a 20 minute charge. This is not to bad if you compare it to commercial fully fledged smartwatches, but for a device that is using an arduino processor and a really non-fancy screen, we expect that the battery life can be drastically improved. On the original Watchduino we managed to use some clever optimizations to expand the battery life from days to months, and we hope we'll be able to do the same with this one.
- We need to make it smaller, prettier and easier to assemble. Our current prototypes are hand soldered, and still we managed to make it small enough to be wearable. But we can do better if we manage to integrate the components into a PCB.

# Follow up

- Hackaday project page: https://hackaday.io/project/7244-watchduino2
