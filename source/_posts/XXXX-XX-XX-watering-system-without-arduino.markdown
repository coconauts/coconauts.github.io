---
layout: post
title: "Add list of featured posts to Octopress"
date: 2015-03-21 15:53:19 +0000
comments: true
categories: software
tags: octopress featured posts plugin ruby template
sharing: true
keywords: ruby,plugin,featured,posts,octopress,template
description: "Add list of featured posts to Octopress"
author: Javier Rengel
featured: true
published: false
---

We learned a few montsh ago how to build a [simple watering system with Arduino](TODO). And that's cool, but you don't really need an Arduino to make this as you can build a prototype just with a couple of transistors, resistors and nails.

<!--more-->

## Build the humidity sensor

You can also build your own humidity sensor, there is no need to buy those overpriced sensor that gets rusty in a few days.

But you can build your own sensor just with 2 metal pieces (eg: nails) and 2 cables.

There is no magic behind this, the more humidity between the two nails, the less resistance. If there's no humidity, resistance is infinite.

## Building the circuit

This is a simple circuit, similar to the one that automatically turns on a LED when a LDR (Light Dependent Resistor) value is high. Again, we don't need an Arduino or any smart device to perform this logic. That's the main purpose of Transistors.

In our case, our water pump will activate when resistance is below a threshold and it will deactivate when resistance is above that threshold. In the same way that the LED gets On when there is no light in the room (LDR is high)

### 2 transistors

TODO

### Variable resistor

TODO

## Add the water pump
