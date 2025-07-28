---
layout: post
title: "Smart staircase LED lighting with Arduino and IR sensors"
date: 2017-02-18 10:42:19 +0000
comments: true
categories: hardware
tags: sensors arduino LED
sharing: true
keywords: sensors,arduino,led,relay
description: "Smart staircase LED lighting with Arduino and IR sensors"
author: Javier Rengel
featured: false
published: false
---

For a long time, we've been turning on the lights at the beginning the staircase,
just to turn them off when we reach another floor.

But instead, we built a simple system to turn them ON automatically when you are going upstairs or downstairs,
just by using a couple of IR proximity sensors, a relay and an Arduino Pro Mini, to control the timing.

<!--more-->

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Smart staircase LED lighting with <a href="https://twitter.com/hashtag/Arduino?src=hash">#Arduino</a> and IR sensors <a href="https://t.co/ns5zh2r8tQ">pic.twitter.com/ns5zh2r8tQ</a></p>&mdash; Javi Rengel (@rephus) <a href="https://twitter.com/rephus/status/830460205699854336">February 11, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

If you want to build your own, just follow our guide.

## Shopping list

* [IR proximity sensor](https://www.aliexpress.com/item/Smart-car-robot-E18-D80NK-infrared-obstacle-avoidance-sensor-proximity-switch-3-80cm-adjustable-Free-Shipping/32396659854.html)
* [Arduino Pro Mini](https://www.aliexpress.com/item/Free-Shipping-new-version-2pcs-lot-Pro-Mini-328-Mini-ATMEGA328-5V-16MHz-for-Arduino/1731218090.html)
* [Relay](https://www.aliexpress.com/item/1pc-1-Channel-5V-Optocoupler-Driver-Relay-Module-High-Level-for-Arduino-top-quality/32638202870.html)
* [5m LED strip](https://www.aliexpress.com/item/Free-Shipping-SMD5050-12V-flexible-light-60-leds-m-LED-strips-5m-lot-White-Blue-Green/1599651146.html)

You can optionally use a power converter (from 12v to 5v) if you want to take advantage of the 12v input to power your Arduino and sensors.

* [12v to 5v converter](https://www.aliexpress.com/item/1Pc-DC-to-DC-12V-to-5V-3A-15W-Auto-Car-Power-Converter-Regulator-Adapter-for/32702720703.html)

## Schema

![schema](/images/posts/2017-02-18-stair-lights/schema.png)

## Arduino code

```
#define IR_RECEIVER 8
#define RELAY 10

void setup() {
  // initialize digital pin LED_BUILTIN as an output.
    pinMode(RELAY, OUTPUT);
  digitalWrite(RELAY, LOW);

}

// the loop function runs over and over again forever
void loop() {

  int sensorValue = digitalRead(IR_RECEIVER);
  // print out the value you read:
  delay(10);        // delay in between reads for stability

  if (sensorValue == 0 ) {
    digitalWrite(RELAY, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(5000);
  }
  else {
    digitalWrite(RELAY, LOW);

  }
}
```

## Images

![arduino](/images/posts/2017-02-18-stair-lights/arduino.jpg)
![upstairs](/images/posts/2017-02-18-stair-lights/upstairs.jpg)
![downstairs](/images/posts/2017-02-18-stair-lights/downstairs.jpg)
