---
layout: post
title: "Notification Listener plugin for Android with Cordova"
date: 2015-10-13 20:16:34 +0000
comments: true
tags: android cordova plugin
sharing: true
categories: software
keywords: NotificationListenerService,android,cordova,notification,listener,plugin
description: "Notification Listener plugin for Android with Cordova"
author: Javier Rengel
published: true
featured: false
---

When we were developing [Watchduino2](/projects/watchduino2) we required to forward messages for all notifications we receive in our phone by using
the [NotificationListenerService](https://developer.android.com/reference/android/service/notification/NotificationListenerService.html) available on Android.

We managed to do this in the first version of our companion app on native code, unfortunatelly, we realised this feature was not available _yet_ on Cordova, the new framework we use for building
our cool responsive companion app.

The solution? Roll our own Cordova plugin to provide this functionality!

<!-- more-->

### How it works

The basic idea of this plugin is to create a callback from JavaScript that will be triggered everytime you get a notification
on Android.

### How to install

Installing this plugin is really simple, and it's like installing any other plugin on Cordova.

    cordova plugin add https://github.com/coconauts/NotificationListener-cordova

### How to use

Simply  create a listener from javascript using this method inside the Cordova initialization code.

    notificationListener.listen(onNotification,onError);

Sample code:

```
var app = {
    initialize: function() {
        this.bindEvents();
    },
    bindEvents: function() {
      document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
      log("Cordova start", "Device ready");

      notificationListener.listen(function(n){
          console.log("Received notification " + JSON.stringify(n) );
        }, function(e){
          console.log("Notification Error " + e);
        })
    }
};

app.initialize();

```

### Disclaimer

As far as I know, listening for notifications is only supported by Android phones (from version 4.0), and we haven't done any IOS development in the past, so I don't thing is
possible to port this plugin to IOS. But feel free to contribute to our project if you think it can be extended to other platforms.
