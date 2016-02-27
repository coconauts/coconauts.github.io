---
layout: page
title: "3D Island Demo"
comments: false
sidebar: true
sharing: false
footer: true
---

3D Island Demo was one of the first projects we did on Unity3D as an experiment
for building Virtual Reality games and testing its performance on Mobile platforms.

<img src="/images/posts/3d-island-demo/img2.png" />

It uses the scene and models from the [Tropical Paradise Unity demo](http://unity3d.com/showcase/live-demos#tropical-paradise).

But because this demo was built for Unity v3 and we use 4.6 we had to fix some parts of the code to make it compatible,
also we replaced the water effect completely with a new one for the free version.

Also, it's optimized for mobile platforms and we included some simple features to make it VR ready.

We noticed that the game runs great in PC, and OK (~30FPS) in a modern phone even with high resolution and good quality.
The bottleneck is the number of details and shadows in the scene, or drawCalls in unity.

But you can try by your own by [downloading](https://play.google.com/store/apps/details?id=net.coconauts.island3d) the demo into your phone.
