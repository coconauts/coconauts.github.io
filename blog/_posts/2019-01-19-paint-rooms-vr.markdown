---
layout: post
title: "Paint walls in VR"
date: 2019-01-19 01:00:14 +0000
comments: true
categories: software
tags: vr
sharing: true
keywords: vr
description: "Paint room walls in virtual reality"
author: Javier Rengel
featured: false
published: true
---

Have you ever wanted to paint a room but did not decide which color to choose ?

We found an easy and cool solution, all you need is a phone (mainly an Android, but if you IOS, just replace the apps and locations with the IOS equivalent) and an image editor to paint your room in Virtual Reality. 

![before](/images/posts/2019-01-19-paint-rooms-vr/before.vr.jpg)
![after](/images/posts/2019-01-19-paint-rooms-vr/after.vr.jpg)

<!--more-->

## Create your 360 picture

First, download the [Google cardboard](https://play.google.com/store/apps/details?id=com.google.samples.apps.cardboarddemo) app for Android.

Open the app, (after a few configuration steps), and go to `cardboard camera` and take the picture by rotating the phone slowly.

The picture will be stored in `sdcard/DCIM/CarboardCamera` with a .vr.jpg extension. Copy that file into your computer.

![before](/images/posts/2019-01-19-paint-rooms-vr/before.vr.jpg)


## Export `_left` and `_right` images

Although the image taken by the cardboard camera looks like a normal jpg image, it contains some metadata that allows the app to support VR. 

Because of this, we need to export the .vr.jpg into two separate images using https://cctoolkit.vectorcult.com/#, this step is key to the whole process. 

Upload your picture into that website and it will get splitted into two (one for each eye). Right click on the images and save them on your computer with `_left` and `_right` names.

![split](/images/posts/2019-01-19-paint-rooms-vr/split.png)


## Editing the VR picture

We used GIMP to edit the image, but you can use photoshop or any other image editor, just open both `_left` and `_right` images you exported before with it and you will see a plain wide image.

![gimp](/images/posts/2019-01-19-paint-rooms-vr/gimp.png)

Now you can edit the images in any way you want, what I did was to use the different select tools to select just (and only) the walls on the room, then move it to another layer (for easier management) and then used the `colourise` tool to change the color.

![colourise](/images/posts/2019-01-19-paint-rooms-vr/colourise.png)

You need to repeat this operation for both images. Once you're done, save both images and be ready to combine them together again. 

## Generate new VR image

Go back to the same website as before https://cctoolkit.vectorcult.com/# and join both images this time, remember to keep the `_left` and `_right` names before uploading. 

This will generate a new .vr.jpg page. Copy the image back on `DCIM/CardboardCamera`. If you did everything correctly, you will see both pictures (the new one and the old one) on the cardboard. If you upload a non-vr image, it won't show on the app. 

![cardboard](/images/posts/2019-01-19-paint-rooms-vr/cardboard.png)

Click on the image and you will see it on VR. That's it, enjoy.

![vr](/images/posts/2019-01-19-paint-rooms-vr/vr.png)
