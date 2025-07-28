---
layout: post
title: "Communicating Android and Arduino via Bluetooth using HC-06 Module"
date: 2015-01-06 21:00:43 +0000
comments: true
categories: hardware software
tags: arduino android bluetooth hc-06
sharing: true
keywords: arduino,android,bluetooth,hc-06
description: "Communicating Android and Arduino via Bluetooth using HC-06 Module"
featured: true
---

Are you sad that Santa didn't get you that phone-controlled quadcopter 
that you wanted for Christmas?

How about building your own? 

It is not as difficult as it seems, 
in Coconauts we will show you how to do it. Or at least, we'll show you 
how to get started with building a small Bluetooth controlled device.

<!--more-->

<table class='summary' border=1>
<tr><th>Description</th><th>Materials</th></tr>
<tr>
<td>

  In this tutorial we will create the simplest ever mobile controlled hellicopter. 
  It will feature an Arduino attached to a motor, that will be listening for speed values
  over a Bluetooth channel. Depending on the speed value received, our Aduino program
  will vary the the rotation speed of the motor accordingly.
  <br/>
  On the other side of the Bluetooth channel, sending the speed values, will be an 
  Android app, that will feature a graphic interface with a slide to select the desired
  values.

</td>
<td>

<ul>
  <li>A phone (with Android)</li>
  <li>An Arduino (any model: UNO, mini, Lylipad, ATMega, etc)</li>
  <li>A DC Motor</li>
  <li>A Bluetooth module (we will use HC-06 in this example)</li>
</ul>

<strong> Links </strong><br/>

<ul>
  <li><a href='https://github.com/coconauts/Arduino-Android-Bluetooth'>Source</a></li>
  <li><a href='https://play.google.com/store/apps/details?id=net.coconauts.quadcopter'>Play store</a></li>
</ul>

<strong> Difficulty </strong>

<div class='rating-2'></div>

</td>
</tr>
</table>
<br/>

Here is a video demostrating the usage of the whole setup:

<iframe width="100%" height="450" src="//www.youtube.com/embed/B-lNE8wwka4" frameborder="0" allowfullscreen></iframe>

### Schema

First of all, connect your Arduino to your DC motor and the HC-06 module as indicated by the schema.

Only 3 digital pins are required in this simple project. 
Pins for the DC motor are exchangeable, but do not mix TX and RX for the Bluetooth module.

<img src="/images/posts/quadcopter-hc06/schema.png" />

### Arduino code

Then, upload the following code to your Arduino (also available 
[here](https://github.com/coconauts/Arduino-Android-Bluetooth/blob/master/arduino/arduino.ino)).

```
#include <SoftwareSerial.h>
 
SoftwareSerial bluetooth(10, 11); // TX, RX

#define MAX_BUFFER 4
 
int motor = 9;    
int speed = 0;
char data;
char* buffer;
boolean receiving = false;
int pos;

void setup()  { 
  bluetooth.begin(9600);
  bluetooth.println("Bluetooth On");
  pinMode(motor, OUTPUT);
  
   buffer = new char[MAX_BUFFER];
} 

void loop()  { 
  
   if (bluetooth.available()){
        
        data=bluetooth.read();
        
         switch(data) {
            //3: End of transmission
            case 3:  receiving = false;  
                    speed = buffer2int(buffer);
                               
                    bluetooth.print("Received: ");
                    bluetooth.print(buffer);
                    bluetooth.print(", Speed: ");
                    bluetooth.println(speed);

                     break; //end message
            default: if (receiving == false) resetData();
                    buffer[pos] = data;
                    pos++;
                     receiving = true;          
          }
   }  
  analogWrite(motor, speed); 
  delay(10);                            
}

 void resetData(){
   for (int i=0; i<=pos; i++) buffer[i] = 0; 
   pos = 0;
}
    
int buffer2int(char* buffer){
  int i;
  sscanf(buffer, "%d", &i);
  return i;
  
}
```

We are using the [SoftwareSerial](http://arduino.cc/en/pmwiki.php?n=Reference/Serial) library for receiving Bluetooth messages.
On the `setup` we hook it to the serial connection using a 9600 baud rate, and then we can read and write from it in a file-handle fashion.

The code inside the loop will read the data coming from Bluetooth 
one character at a time, and it will append all received characters to a string buffer,
until we reach EOT (End Of Transmission, ASCII character number 3).

Then the numeric value of the string will be converted using [sscanf](http://www.cplusplus.com/reference/cstdio/sscanf/)
and passed to the motor's pin as a analog value using [analogWrite](http://arduino.cc/en/pmwiki.php?n=Reference/analogWrite).

However, when you first run this code, it will keep waiting until the other end of the 
transmission is connected. If you are you are using a Bluetooth board equipped with a LED,
like this one:

<img src="/images/posts/quadcopter-hc06/hc06.jpg" />

then the LED will start blinking (that means is not connected yet). So lets fix this.

### Connecting Bluetooth to Android

Before you start toying with the Android app, you first need to connect your Bluetooth device and your Android.

In order to do so, and test that your Bluetooth module is working properly, 
go to the Bluetooth manager screen in your Android device, and enable it if it's not enabled.

If you now search for devices, you should see our friend HC-06. click on it and follow the steps until it gets paired.


### Android app

Now is time to run the Android app. Our code is making use of the very known BluetoothService class
from [Bluetooth chat example](http://developer.android.com/samples/index.html), with a few tiny modifications
to allow HC-06 and EOT ending character.

The full code for the Android app is available [here](https://github.com/coconauts/Arduino-Android-Bluetooth/tree/master/android). If you feel brave enough, you can import our app from gradle, build and upload
the app to your phone, or you can cheat and directly grab a version we conveniently uploaded to the [Play Store](https://play.google.com/store/apps/details?id=net.coconauts.quadcopter).

The moment you open the app, a Bluetooh connection shoud be stablished
with the paired HC-06 (at this point, if your HC-06 module is LED-equipped, it should not blink anymore). If you loose the connection
there is a button for reconnecting on the interface.

Congratulations, your Bluetooth app is set. 
You can now togge the slider on the android app, and inmediately
see how the motor rotates at different speeds, as shown in the video.

