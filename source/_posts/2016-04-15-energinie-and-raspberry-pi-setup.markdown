---
layout: post
title: "Build a smart home using Raspberry PI and Energenie"
date: 2016-04-15 20:51:00 +0000
comments: true
tags: energenie raspberry pi LED limitations dashboard
sharing: true
categories: hardware
keywords: energenie,raspberry pi,LED,limitations,dashboard
description: "Build a smart home using Raspberry PI and Energenie"
author: Javier Rengel
published: true
featured: false
---

We recently discovered [Energenie](https://energenie4u.co.uk/) (thanks to [Manoj](https://twitter.com/Man0jN)) a nice and cheap remote controlled socket
which also provides a custom Raspberry PI board so you can programatically control those
sockets from your PI, which allows endless possibilities, from temporized sockets, to a socket that
automatically turns on when detects presence using a PIR sensor, or triggered by a website or a phone app.

<!-- more -->

You can buy 2 different types of Energenie, some [individual sockets](https://energenie4u.co.uk/catalogue/product/ENER002-4)
or an [extension lead socket with 4 individually controlled](https://energenie4u.co.uk/catalogue/product/ENER010)
plus the Raspberry PI board. You can also find them cheaper on Amazon or [Ebay](http://www.ebay.co.uk/itm/161972721449?_trksid=p2060353.m2749.l2649&ssPageName=STRK%3AMEBIDX%3AIT)

Every Energenie comes with a remote that you can use to power on or off those sockets using radio
(no need to point with the controller to the socket like an infrared remote),
and the board acts in a similar way.

You can download a library for Python to use with Raspberry PI from [here](http://pythonhosted.org/energenie/)

As our first project, we built a website so you can control all sockets in the extension lead from your
computer, in one of them we added some Cinema style lights under our sofa using a LED strip connected to a 12V supplier on
the socket.

<img src='https://farm2.staticflickr.com/1704/26449115715_b672c53b20_z_d.jpg'/>
<img src='https://farm2.staticflickr.com/1652/26449115515_60a9fd10a7_z_d.jpg'/>

Download our own webapp written on Python+Flask from our [Github](https://github.com/rephus/energenie-manager) which looks like this:

<img src='https://farm2.staticflickr.com/1630/26423191956_b64967a883_o_d.png'/>

### Warnings and limitations

Each Raspberry PI board or remote allows you to use 4 different sockets ( or 1 extension lead)  maximum. Which means you can't have for example 5 sockets controlled with a single Raspberry PI.

Each socket can only be paired with 2 controllers maximum, which means you can't control a socket with a remote and 2 Raspberry PIs. Every time you pair a new socket, the oldest one will get unpaired. Also, remember to pair every device before using it or it won't work.


Do you have more ideas to use with Energenie?, just leave us some comments.
