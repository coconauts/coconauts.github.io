---
layout: post
title: "Building 3D virtual reality games with Unity3D"
date: 2015-06-20 15:53:19 +0000
comments: true
categories: games
tags: unity3d vr game
sharing: true
keywords: game,unity,3d,virtual reality,vr,oculus rift,unity3d
description: "Virtual reality game demo for android"
author: Javier Rengel
featured: false
published: true
---

All the big companies like Samsung, Sony and even Facebook are doing their best to build the 
ultimate Virtual Reality headset and make it standard.

Once they are in the market, we (indie game developers) need to be ready to build VR games 
so everyone can enjoy their fancy expensive devices.

So, in order to start playing with them, you could either pay 350$ dollars for a [Oculus Rift developing kit](https://www.oculus.com/order/), 
or you could get one of those cheap kits from [Google](http://www.aliexpress.com/item/High-quality-DIY-Google-Cardboard-Virtual-Reality-VR-Mobile-Phone-3D-Glasses-for-5-0-Screen/32301733749.html?s=p) 
or even [build your own](https://twitter.com/rephus/status/587297530045714432), and start building games in Unity3D.

<img src="/images/posts/3d-island-demo/img1.png" />

<!--more-->

We recently built a VR technical demo in Unity and it's available on [Play store](https://play.google.com/store/apps/details?id=net.coconauts.island3d).
The purpose of this demo was built to test the performance of a Virtual Reality environment in Unity3D. 

<img src="/images/posts/3d-island-demo/img2.png" />

It uses the scene and models from the [Tropical Paradise Unity demo](http://unity3d.com/showcase/live-demos#tropical-paradise),

But because this demo was built for Unity v3 and we use 4.6 we had to fix some parts of the code to make it compatible,
also we replaced the water effect completely with a new one for the free version.

Also, it's optimized for mobile platforms and we included some simple features to make it VR ready.

We noticed that the game runs great in PC, and OK (~30FPS) in a modern phone even with high resolution and good quality.
The bottleneck is the number of details and shadows in the scene, or drawCalls in unity.

But you can try by your own by [downloading](https://play.google.com/store/apps/details?id=net.coconauts.island3d) the game into your phone.

If you have a question or want more details about our demo, please let us know in the comments.
