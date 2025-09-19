---
layout: post
title: "Lightning Dodge-O-Matic"
date: 2025-09-18 10:00:00 +0000
categories: hardware
tags: arduino gaming hardware ffx automation
keywords: arduino ffx lightning dodge gaming hardware
description: "Building an Arduino-powered device to automatically dodge 200 lightning bolts in Final Fantasy X"
author: Javier Rengel
published: true
---

If you've ever played Final Fantasy X, you know about _that_ challenge. The one that makes even seasoned players break their controllers in frustration. Yes, I'm talking about dodging 200 consecutive lightning strikes in the Thunder Plains to get Lulu's ultimate weapon. After countless failed attempts and watching that counter reset to zero at strike 197, I decided enough was enough. Time to engineer a solution.

That's how the Lightning Dodge-O-Matic was born: an Arduino-powered device that uses light detection to automatically dodge lightning strikes on my PS Vita. No more pixel-perfect timing, no more sweaty palms, just pure automated precision. Let me show you how it works!

<video width="600" height="400" controls style="display: block; margin: 0 auto; text-align: center;">
  <source src="https://github.com/rephus/lightning-dodge-O-matic/raw/master/video.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

<!--more-->

## The Thunder Plains Challenge

For those unfamiliar with FFX's most infamous mini-game, here's the deal: you need to dodge 200 consecutive lightning strikes without getting hit once. Each strike is preceded by a brief screen flash, giving you roughly 0.2 seconds to press X. Miss one? Back to zero. The reward is significant - Lulu's Celestial Weapon with the "No Encounters" ability - but the challenge is absolutely brutal.

The difficulty comes from several factors:
- The timing window is incredibly tight (around 200ms)
- Lightning strikes are semi-random, making it hard to get into a rhythm
- Mental fatigue sets in after 50+ dodges, increasing error probability
- Any distraction or slight delay means starting over

I managed to get this achievement when I played the original game on PS2. But I didn't want to suffer again when I replayed this classic on PSP, then I realized this was a perfect candidate for automation. The pattern is simple: detect flash → press button. Classic Arduino territory!

## Hardware Design

<img src="https://github.com/rephus/lightning-dodge-O-matic/raw/master/schema_bb.png" alt="Breadboard schema" style="display: block; margin: 0 auto; text-align: center;">

The hardware setup is surprisingly straightforward, using components that most Arduino hobbyists already have lying around:

- **Arduino Uno/mini/nano**: The brain of the operation
- **Light Dependent Resistor (LDR)**: Detects the lightning flash on screen
- **Servo Motor**: Physically presses the X button
- **110Ω Resistor**: Creates a voltage divider for accurate LDR readings

The wiring is minimal:
```
LDR + → A0 (Analog input)
LDR - → VCC
110Ω Resistor + → GND
110Ω Resistor - → A0
Servo Signal → D9
Servo Power → VCC
Servo Ground → GND
```

The LDR is positioned directly on the PS Vita screen where the flash occurs most prominently. I found the upper-middle portion works best, as it catches the flash regardless of character position. The servo is mounted above the X button using a simple LEGO frame - adjustable, reusable, and doesn't damage the device.

## Software Implementation

The Arduino code is elegantly simple, which is exactly what we want for time-critical operations. Here's the core logic:

```cpp
#include <Servo.h>

Servo buttonPresser;

int servoPin = 9;
int sensorPin = A0;    // select the input pin for the potentiometer
int ledPin = 13;      // select the pin for the LED
int sensorValue = 0;  // variable to store the value coming from the sensor

void setup() {
  // declare the ledPin as an OUTPUT:
    Serial.begin(9600);
  buttonPresser.attach(servoPin);
  buttonPresser.write(0);  // Rest position

  pinMode(ledPin, OUTPUT);
}

void loop() {
  // read the value from the sensor:
  sensorValue = analogRead(sensorPin);
  Serial.println(sensorValue);

  if (sensorValue > 50) {
    digitalWrite(ledPin, HIGH);
    buttonPresser.write(30);  // Press position

    delay(1000);
    digitalWrite(ledPin, LOW);
    buttonPresser.write(0);    // Release

  }

  // stop the program for for <sensorValue> milliseconds:
  delay(10);
}
```

The algorithm continuously monitors light levels through the LDR. When it detects a spike above the baseline threshold (indicating a lightning flash), it triggers the servo to press and release the X button. The cooldown period prevents multiple triggers from the same flash.

## Calibration and Tuning

Getting this to work reliably required some fine-tuning:

1. **Light Threshold**: Different screen brightness settings require different thresholds. Adjust the `50` default threshold depending on your console brightness.

2. **Servo Positioning**: The servo arm needs to press the button firmly but not too hard. I used trial and error to find the sweet spot - 30 degrees for press, 0 for release.

3. **Timing Windows**: The original 200ms window sounds tight, but the Arduino responds in microseconds. The real challenge was avoiding false positives from other screen effects.

4. **LDR Placement**: Critical for consistent detection. Too close to the edge and you miss some flashes; too central and character animations cause false triggers.

## Results and Performance

<img src="https://github.com/rephus/lightning-dodge-O-matic/raw/master/record.jpg" alt="Success!" style="display: block; margin: 0 auto; text-align: center;">

The results speak for themselves I avoided not 200, but  **1066 consecutive dodges achieved!**

The most satisfying part? Watching it work flawlessly while I grab a coffee. No stress, no cramped fingers, no rage-quitting.

Is it cheating? Yes it is. Is it incredibly satisfying to watch? Absolutely. And honestly, after the hundreds of legitimate attempts I made on PSP, I'd say I earned that Celestial Weapon one way or another.

The complete source code and schematics are available on [GitHub](https://github.com/rephus/lightning-dodge-O-matic). If you build your own version or adapt it for other games, I'd love to hear about it!

Now if you'll excuse me, I need to figure out how to automate the Chocobo racing mini-game...