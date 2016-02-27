---
layout: post
title: "Arduino vs Raspberry Pi"
date: 2014-07-05 17:37:00 +0100
comments: true
categories: hardware
tags: arduino raspberry vs
published: true
sharing: true
keywords: arduino,raspberry,vs,comparison,size,consumption,code,processing
description: "Arduino vs Raspberry Pi comparison for development, strengths and weakness"
---

Sometimes, when you want to build a project, you need to think which is the best platform for you, weather server, desktop, Raspberry Pi or Arduino.
If you have no experience at all, you may think you want to build a weareable device (like our [WatchDuino](/projects/watchduino) project) using a Raspberry Pi, or a webpage or a smart robot with light and sounds using an Arduino, when in fact these are not the optimal choices.
That's why we would like to point out the main differences between Rasbperry Pi and Arduino, and which makes them the best or the worst depending on the kind of project.

<!--more-->

## Size

Lets start with something obvious, the size.

If you want to build something small, wearable, or hidden in a hat, you need to use Arduino. 

Your first impression might be that Arduino Uno and Raspberry Pi are actually similar in size, but the difference relies in that you can shrink Arduino as much as you want (up to chip size), or use a different smaller model, like Arduino Nano or Arduino Mini (which is smaller than nano). Whereas you can't shrink a Raspberry Pi at all.

So Arduino is the obvious choice when size matters. You can always prototype and develop using an Arduino Uno, and then use a smaller version when you need to integrate it into your project.

## Power consumption

The consumption is, in some way, related with the size. The Raspberry Pi is big because it has a lot of controllers and better processor, which means it needs more power to work.
However, Arduino can reduce its consumption a lot if you remove all the useless inboard components (like leds and the USB controller).

For instance, our [WatchDuino](/projects/watchduino) project used a standalone ATMega chip (so not even an Arduino Mini) to optimize the power consumption as much as possible.

## Portability

Obviously, portability is a mix of consumption and size. You can build a robot for home with a Raspberry Pi, but just keep in mind it will be big and you may need to charge it quite often.

## Processing

Because Raspberry Pi processor is 700MHz (overclokable up to 1Ghz) and Arduino is only 8 or 16Mhz, you shouldn't use Arduino to do big calculations or run math heavy code. 
Forget about doing something like image recognition, fast fourier transform comparisons or something like that (not even the Raspberry Pi can handle that smoothly).

## Code complexity

If your need to code something more complex than just giving a result according to an input, then probably Arduino is not the best platform for you.
It is not just because it is using C++ (we will talk about this later), it is also because Arduino (ATMega) has a very limited code space (up to 32Kb), 
so you can't use all the libraries you want as they won't fit your flash program memory.

## C++

If you don't want to have the chance to choose between different languages (Java, NodeJs, Python, Ruby, Perl, Bash...) and just want to use C++, then you'll feel at home with Arduino.
You cannot use anything else, only C++, and don't try to use `pip` or `npm` or `maven` as it won't work. 

Thankfully, the guys at [biicode](http://biicode.com) made our life a bit easier building a platform to reuse some C++ code, so if you want to use some community libraries (like in pip), you should have a look.

## Inputs

Both Arduino and Raspberry Pi are good at reading digital inputs (although it's a bit confusing in the Raspberry Pi), and both also have a 3v and 5v output, which is good.
However, Raspberry Pi doesn't have analog inputs, which is a disadvantage when using resistances or any kind of analog device. But it doesn't mean you can't use them, there are
two popular techniques for reading analog inputs, you can either use a capacitor or an ADC chip (analog to digital converter) like the MCP3008 (we will talk about this important topic in a future post).

## Web server

Do you want to host a webpage or webserver ? then go for the Raspberry Pi, and use whatever language you prefer, like Python+Flask, NodeJs, Apache+PHP, etc. 
At this point of the post I think it's not worth explaining why you cannot host a web server on an Arduino.

## Advanced Audio/Video support

Of course you can get an Arduino Mega and connect 20 pins to a powerful LCD screen and show some fancy graphic effects using C++ with Adafruit GFX, 
but I am pretty sure it is going to be easier for you if you go for the Raspberry Pi and use the HDMI or video output, right? 
Actually, if you are going to use a full color LCD, it means the consumption is not that important in your project.

The same goes for complex audio support (rather than just playing some sounds with a buzzer).
If you want to play MP3, WAV or OGG files, it's much easier to use `aplay` or `from pygame import mixer` in Python than stacking some Arduino shields.

If you still want to make your Raspberry Pi portable, you can use a portable USB-powered-speaker like the X-Mini or get one for [less than 3 pounds](http://www.amazon.co.uk/DIGIFLEX-Portable-Travel-Speaker-iPhone/dp/B003TKTUUY/ref=sr_1_4?ie=UTF8&qid=1404482399&sr=8-4&keywords=portable+speaker)

