---
layout: post
title: "Hackaday price 2015 retrospective"
date: 2015-10-06 21:40:34 +0000
comments: true
tags: watchduino arduino hackaday
sharing: true
categories: software
keywords: watchduino,arduino,finalist,price,hackaday,hardware
description: "Hackaday.io price 2015 retrospective"
author: Javier Rengel
published: true
featured: true
---

<img src='https://farm1.staticflickr.com/584/21381222983_a64f947c8d_o_d.png' align='right'/>

You may have noticed that the blog has been quite quiet during the last month.
The reason being we were focusing our efforts on doing some epic Watchduino
development, as [contestants for the Hackaday Prize 2015](https://hackaday.io/project/7244-watchduino2).
Sad news in the end though, as we didn't make it to the finals.

But that's ok though. Regardless of the result, this has been a good excercise
for us, and the contest has pushed us to keep working hard on the
[Watchduino](/projects/watchduino2) project. That's why we want to
sum up all we have learned and all we have improved on the project during
the course of the contest.

<!-- more -->

### 3D Case

<img class='screenshot' src='https://farm1.staticflickr.com/760/21814249490_2bfe5bf2b9_z_d.jpg'/>
<img class='screenshot' src='https://farm6.staticflickr.com/5717/21815509489_5531e2b080_z_d.jpg'/>

One of the things in our TODO list was to build a proper 3D case for our watch,
and thanks to our [3D printer](https://twitter.com/rephus/status/571811583602647040) we managed to build a wearable prototype.

We also introduced the Smart Strap design which allows us to keep some of the
electronic components spread along the strap, keeping the watch face smaller.

Our first case design, from a few months ago, was done in [Blender](https://www.blender.org/),
however we've now switched to [Tinkercad](https://tinkercad.com/things/gG641gG1b4c) as it's a great web platform for doing
awesome 3D models really quickly.

We also designed an additional strap prototype using a flexible strap, that we
plan to 3D print soon enough.

### Migration to Cordova

<img class='screenshot' src='https://farm1.staticflickr.com/694/21815557799_9d65cd5172_z_d.jpg'/>
<img class='screenshot' src='https://farm1.staticflickr.com/668/21814312750_9f80cebaa1_b_d.jpg'/>

A few weeks before we joined the contest, we started migrating the existing
Android companion app, written natively, to the Cordova framework.

The reason for this is because Cordova seems a better platform for us, based
on HTML5 + JS, and multiplatform. It's easier and faster to develop with,
the codebase is smaller, and in general we are quite happy with it!

We finally migrated all the code with a better design by the end of August,
and we even introduced new functionality.

### Showcase videos

We made two videos to showcase the capabilities of the watch.

<iframe width="100%" height="500" src="https://www.youtube.com/embed/n-ubg1R2e-A" frameborder="0" allowfullscreen></iframe>

<iframe width="100%" height="500" src="https://www.youtube.com/embed/LVE85OxWGzs" frameborder="0" allowfullscreen></iframe>

### Open source code and documentation

One of the requirements of the project was to release our code and build our
documentation so everyone can create a new Watchduino from scratch.

This has been in our roadmap for ages, so it was a good excuse to clean up
the code a bit an make it public.

Feel free to [clone our project](https://github.com/coconauts/watchduino2), and to make pull request to improve our own.

Be warned though: the codebase is still under heavy development, so things
might change drastically from one day to the next!

### Next steps

The community also helped us to improve our watch architecture and we are keen on
trying different approaches so Watchduino can be even better than it's now.

One of the main objectives is to improve the Bluetooth connectivity and
the power consumption. Another one is to make an app creation framework that is
lean and easy to use.

Stay tuned for more updates, are we are definitely not done with our
Watchduino development!
