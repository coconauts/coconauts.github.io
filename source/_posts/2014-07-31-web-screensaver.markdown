---
layout: post
title: "Web screensaver"
date: 2014-08-02 00:00:00 +0100
comments: true
categories: software
tags: photos chromium screensaver
published: true
sharing: true
keywords: chrome,chromium,screensaver,script,photo,gallery
description: "Chrome screensaver script for web photo gallery"
---

We have just started a new project similar to our music player, [Gramola](/projects/gramola),
to show our photos in a web browser, after our disappointment with existing solutions such as Piwigo or Gallery2. 
We hope that you'll hear some more about it in the future.

In the meantime, while deciding about features to implement, a slideshow mode obviously came out as part of them. 
And we though about how cool would it be to be able to have the photo slideshow as an screensaver for your desktop.

<!--more-->

So in order to achieve this, Javier wrote a tiny bash script that will open any webpage in a fullscreen browser after a certain time of inactivity, 
and it will close itself when it detects activity again. So effectively it's a screensaver that shows websites.

We use `xprintidle` to get the time of inactivity and `chromium-browser` (not google-chrome) to open the web as an app with some chromium specific features like --start-maximized

Here's the code:

``` bash
    #!/bin/bash

    app="http://www.google.com/trends/hottrends/visualize?nrow=5&ncol=5"
    wait=10000 #Time in miliseconds

    chromium_id=""
    while true; do 
    idle=`xprintidle`
    if [ $idle -gt $wait ]; then
        if [ -z $chromium_id ]; then
        
        chromium-browser --app=$app --start-maximized --fast-start &>> chromium.log &
        chromium_id="$!"
        echo "Away, running screensaver (id:$chromium_id)"
        fi
    elif [ $chromium_id ]; then #Screensaver is running
        echo "Welcome back, closing screensaver (id:$chromium_id)"
        kill "$chromium_id"
        chromium_id=""
    fi
    sleep 1
    done 
```

Here's a demo of what will happen if you run it. Notice how the screensaver stops once you move the cursor:

<iframe width="100%" height="450" src="//www.youtube.com/embed/FSFB_Lx41Hs" frameborder="0" allowfullscreen></iframe>

So, once we finish the photo app with the slideshow feature, we will be able to use it as an screensaver for our desktop computer/rasbperry pi/laptop...

Get the latest version of this code in [our project page in bitbucket](http://bitbucket.org/coconauts/chromium-screensaver/).