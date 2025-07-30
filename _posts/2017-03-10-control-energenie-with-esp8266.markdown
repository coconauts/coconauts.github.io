---
layout: post
title: "Control Energenie with ESP8266"
date: 2017-03-10 21:30:19 +0000
comments: true
categories: hardware
tags: energenie esp8266 radio smart
sharing: true
keywords: energenie,esp8266,esp8,radio,433mhz
description: "Control Energenie sockes with ESP8266 over radio 433Mhz"
author: Javier Rengel
featured: false
published: true
---

We recently showed you how to control [Energenie sockets using Pebble smartwatch app](http://coconauts.net/blog/2017/02/15/control-energenie-with-pebble/),
thanks to a [Raspberry PI](http://coconauts.net/blog/2016/04/15/energinie-and-raspberry-pi-setup/) REST API.

But we recently found this [Github repo](https://github.com/cjdell/esp-rf-switch)
about how to use a generic 433Mhz radio module with an ESP8266  to control Energenie sockets.

<!--more-->

So we decided to replace our Raspberry setup with this cheaper, smaller, portable and scalabe solution.

All you need is an ESP8266 and this tiny and cheap radio module

![radio-transmitter](/images/posts/2017-02-16-control-energenie-esp8266/radio-transmitter.png)

In order to build this

![hardware](/images/posts/2017-02-16-control-energenie-esp8266/hardware.png)

The detailed guide and schemas about how to do it is on our [own Github repo](https://github.com/rephus/esp8266-energenie-switch)
