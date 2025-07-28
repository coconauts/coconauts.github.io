---
layout: post
title: "Arduino radio improvements - low consumption"
date: 2014-10-18 00:00:00 +0100
comments: true
sharing: true
categories: hardware
tags: arduino radio raspberry optimisation
published: true
keywords: arduino,radio,raspberry,optimisation,consumption,battery-safe
description: "Low consumption improvements for Arduino and Raspberry comunication using radio RF24"
---

In our previous post about how to [send Readings From Arduino to a Raspberry Pi via radio](http://www.coconauts.net/blog/2014/09/03/send-readings-from-arduino-to-raspberry-via-radio/) 
we explained the basics of the Arduino-Raspberry Pi comunication and we shared a simple code.

But there is more, with a mix of hardware and software, we managed to reduce its power 
consumption down to the minimum (between 1mAh and 0mAh while sleeping).
Which means, your portable sensor will be able to function autonomously with an external
battery for the longest time possible.

<img src="/images/posts/arduino-rf24-low-consumption/consumption.jpg" />

<!--more-->

## Things we improved

The key to this improvement is not only to sleep the Arduino for as much time as possible,
but also to turn off all the devices we don't require while it's sleeping, things like the
RF24 or even the Analog sensor.
In order to achieve that, we need to change its configuration and use an additional digital pin to disable them all.

### Hardware

First, lets have a look at the new schema

<img src="/images/posts/arduino-rf24-low-consumption/schema.png" />

What's new: All VCC pins for our components (led, RF24, sensor) are connected
to digital pin 8. This way we can enable and disable them via code by sending
a LOW or HIGH signal through that pin. We will turn them on only when we need
them, and disable them when the Arduino is in sleep mode.

### Software

Our goal here is to turn down the RF24 device completely. As it turns out, when
we start the radio via code with radio.begin(), some extra digital pins are
automatically enabled by the library, and they stay like that even if we go
to sleep mode.
So what we'll do is to manually disable them before going to sleep, to lower
the consumption. When we wake up again, at the beginning of the loop, we restart
the radio by repeating the startup steps.

Check the following code for more details or download it from the [GIT repository](https://github.com/coconauts/light-rf24/blob/master/arduino_lowpower/arduino_lowpower.ino)

```
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
#include <JeeLib.h>

#define LDR 0 // Select input pin for the photocell light sensor.
#define FREQ 60000 //Frequency of readings (in ms)

#define POWER 8 //power pin to reduce consumption while sleeping

int val = 0; // Variable to store the value coming from the sensor.

//rf24
#define DEVICE_ID 1
#define CHANNEL 1 //MAX 127
RF24 radio(9,10);
byte pipe[]= {"light"};
 
ISR(WDT_vect) { Sleepy::watchdogEvent(); }

#define MAX_SENSOR_VALUE 1023
#define MAX_RADIO_VALUE 254

void setup() {
    
  pinMode(LDR, INPUT); // Declare LDR as an input pin.
  pinMode(POWER, OUTPUT);  
}
 
void loop() {
  digitalWrite(POWER, HIGH);
  val = analogRead(LDR); // Read current value from the sensor.
  
  restartRadio();
  radio.write(&val , sizeof(val) ); //Send via radio
  stopRadio();
  
  digitalWrite(POWER, LOW);
  Sleepy::loseSomeTime(FREQ);
}

void stopRadio(){
  
  radio.powerDown();
  
  pinMode(13, LOW);
  pinMode(12, LOW);
  pinMode(11, LOW);
  pinMode(10, LOW);
  pinMode(9, LOW);
}

void restartRadio(){
  radio.begin(); // Start up the radio
  radio.setChannel(CHANNEL);
  radio.setAutoAck(1);     // Ensure autoACK is enabled
  radio.setRetries(15,15); // Max delay between retries & number of retries
  radio.openWritingPipe(pipe);
  radio.stopListening();
}
```

## Conclussions

This new version drastically improves the power consumption, allowing you to not having to worry about
having to recharge your batteries in a very long time. Or you could even use cell batteries.

We also created a fully assembled version for the sensor, with an optional led, removable RF24, and exchangeable
sensors (so you can use any other analog sensor, like temperature); and this is the result.

<img src="/images/posts/arduino-rf24-low-consumption/assembled.jpg" />

And just to prove the point we were mentioning just before, this assembled device has been running with the
same battery charge for about a month now!
