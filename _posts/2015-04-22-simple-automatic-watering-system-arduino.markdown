---
layout: post
title: "Simple automatic watering system with Arduino"
date: 2015-04-22 21:57:19 +0000
comments: true
categories: hardware
tags: arduino automatic water
sharing: true
keywords: arduino,water,garden,automatic,plants
description: "Simple automatic watering system with Arduino"
author: Javier Rengel
featured: false
published: true
---

Summer is comming and we may need to water our plants almost everyday, 
but we should take advantage of technology and let machines water our plants for us.

Today we will show you how to build a simple and smart watering system using Arduino.

<!--more-->

<table class='summary' border=1>
<tr><th>Description</th><th>Materials</th></tr>
<tr>
<td>

  In this tutorial we will create a simple watering system using basic Arduino code,
  with sensors and some digital outputs.
  
  <img src="/images/posts/automatic-watering/final.jpg" style="width:400px"/>
  
</td>
<td>

<ul>
  <li>A water pump</li>
  <li>A humidity sensor (optional)</li>
  <li>Arduino (Mini, Nano, UNO, etc)</li>
  <li>An NPN transistor</li>
  <li>Water</li>
  <li>Plants (optional)</li>
</ul>

<strong> Links </strong><br/>

<ul>
  <li><a href='https://github.com/coconauts/automatic-watering'>Source</a></li>
</ul>

<strong> Difficulty </strong>

<div class='rating-2'></div>

</td>
</tr>
</table>
<br/>

  <iframe width="100%" height="450" src="https://www.youtube.com/embed/2DbnXBLUOXo" frameborder="0" allowfullscreen></iframe>


First you need to enable your water pump from Arduino.
Some of them may have different current requirements, mine works on  current: 0.05A~0.12A.
However, Arduino I/O pins have 
some [current limitations](http://playground.arduino.cc/Main/ArduinoPinCurrentLimitations) (up to 40.0 mA),
therefore we will use a transistor as a switching device, connected directly to VCC.

You can see all the details in the schema below.

<img src="https://raw.githubusercontent.com/coconauts/automatic-watering/master/automatic-watering_bb.png"/>

Another thing to mention is that we want our automatic watering system to have two different functions:

* Time-based: Water the plants every `x` seconds during `y` seconds.
* Humidity-based: Water the plants everytime it hits a threshold.

To pick either of the methods we will use a normal switch that we will read inside the loop in our code.

Here's the Arduino sketch, also available on [github](https://github.com/coconauts/automatic-watering)

```
#define HUMIDITY_SENSOR 10
#define WATER_PUMP 9
#define MODE 4 
#define LED 13  //For notification

#define HUMIDITY_THRESHOLD 50
#define PUMP_FREQUENCY 1000
#define PUMP_ENABLE_TIME 1000 // Time to be enabled (in ms)

int mode;
int humidityRead;
long lastTimeActive;
bool pumpEnabled;

void setup(){
  pinMode(HUMIDITY_SENSOR, INPUT);
  pinMode(WATER_PUMP, OUTPUT); 
  pinMode(LED, OUTPUT); 

  pinMode(MODE, INPUT); digitalWrite(MODE,HIGH);
  
  disablePump();
}

void loop(){
  mode = digitalRead(MODE);
  
  if (mode == HIGH) { //time mode
    if (!pumpEnabled && millis() > lastTimeActive + PUMP_FREQUENCY) {
      enablePump();
      lastTimeActive = millis();
    } 
    if (pumpEnabled && millis() > lastTimeActive + PUMP_ENABLE_TIME) {
      disablePump();
      lastTimeActive = millis();
    }
  } else { //Humidity mode

    humidityRead = analogRead(A0);
    
    if (humidityRead < HUMIDITY_THRESHOLD) {
      if (!pumpEnabled) enablePump();
    } else {
      if (pumpEnabled) disablePump();
    }
  }
  
  delay(1000);
}

void enablePump() {

    digitalWrite(WATER_PUMP, HIGH); 
    digitalWrite(LED, HIGH); 

    pumpEnabled = true;
}


void disablePump() {

  digitalWrite(WATER_PUMP, LOW); 
  digitalWrite(LED, LOW); 

  pumpEnabled = false;
}

```

If you don't have a humidity sensor (or don't want to use one), 
you can remove both (the switch and the sensor) from the schema.


But also, you can use this for watering multiple plants, 
or you could use this project for your pets or to wake  up in the morning covered by water in your bed.