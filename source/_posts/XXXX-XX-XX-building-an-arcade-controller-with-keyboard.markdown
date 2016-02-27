---
layout: post
title: "Build an Arcade controller with a keyboard"
date: 2015-03-21 15:53:19 +0000
comments: true
categories: hardware
tags: arcade electronics
sharing: true
keywords: circuit,keyboard,arcade,electronics,cheap,mapping
description: "Build an Arcade controller with a cheap keyboard"
author: Javier Rengel
featured: false
published: false
---

One of the most interesting projects you can build with a Raspberry PI is a tiny Arcade machine with some emulators and cool stuff. 
And one of the most important parts in the Arcade machine is the arcade controller. 
Unfortunatelly, Raspberry GPIO pins only support a few buttons and USB arcade gamepads in the market are quite expensive,
but today we will show you how to build your own arcade controller using a cheap keyboard to support 100s of keys. 

<!--more-->

## Finding your keyboard

All you need is a keyboard (preferably USB if you want to make it fully compatible with Raspberry PI), the cheaper the better.

The best keyboard we have found so far is this cheap [rubber keyboard](TODO), apart from being one of the cheapest keyboards you can find,
the pins in the integrated circuit are soldered, which is going to be useful when soldering the pins.

TODO picture

## Finding your keys

This is the most important and tricky part in the process, but quite straightforward.

You need to find which key in the plastic layout maps to which pin in the circuit. 
You can map the whole keyboard, but that would take ages, just focus on the keys you want to use in your controller
(eg: up, down, left, right, spacebar, esc, enter, a, s, d...)

We recommend using a Polimeter for detecting conductance, 
but you can also use a led inside a circuit.

Just connects one end to the plastic layout and then touch everypin in the circuit until the polimeter sounds,
you need to repeat this process twice for each key you want to map.

TODO list of mapped keys

## Soldering both ends to the buttons

Once you know what are the pins for each key, you can solder a button or use a pin socket instead.

This is how it should look like.

## Testing the controller

For the final test, plug in your new controller to your computer. 
Remember, it's a keyboard disguised as a game controller, so you can open a text editor and test that 
all your keys are working properly.

Now open your favorite emualator and map all the keys with your "keyboard"

TODO Image of emulator and game

Obviously, you can use this very same method with USB Joystics or Mouses , but it won't be as cheap as this method 
and also you will get a limited set of buttons from them.