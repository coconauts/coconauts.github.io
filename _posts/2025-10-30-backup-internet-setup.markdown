---
layout: post
title: "Backup Internet Setup for Emergencies"
date: 2025-10-28 10:00:00 +0000
categories: hardware
description: ""
author: Mar Bartolome
featured: false
published: true
---

We take so many things for granted in life when they are working fine, but when they fail, you suddenly realize they hanging by a thread - like, literally, THE INTERNET.

At home, we get our Internet from a fiber connection, which, as it turns out, it's just light pulses coming thru a cable down the street. And this is a single point of failure, ready to be attacked by unlikely adversaries...

<!--more-->

<img src="/images/posts/rat.webp" alt="A cheeky rat" style="display: block; margin: 0 auto; text-align: center;">

Rats! These pesky critters happen to co-live in our neighborhood, and for mysterious reasons they love chewing on the fiber Internet cables - so light pulses no longer reach our home: the LED pilots fade out in our router, and despair looms, for we are now isolated from the digital world. 

<div class="img-with-text" style="display: block; margin: 0 auto; text-align: center;">
    <img src="/images/posts/ohnointernet.png" alt="Router lights out" >
</div>

Our Internet provider eventually sends a technician to fix the broken cables and bring us back to civilization, but sometimes they take a few days (or even weeks!). They are nice enough to give us complimentary 100GBs of mobile data per day (ie 4G/5G), so we can get going with our lives as we wait. 

## But the problem escalates...

However, this solution is severely limited for our needs. We can only tap into this connection with a mobile phone, and use it to provide a WiFi hotspot using tethering. This is an acceptable solution if you just need temporary internet on a laptop to work, or a tablet to watch Netflix. But in our case, we don't just use the internet for work and leisure: we need it for our house to function.

We're the kind of geeks that are fond of domotics and home automations, and our house is riddled with smart devices to the point of ridiculous: we have around a hundred devices connected to our network, each of them with a fixed IP, integrated with [Home Assistant](https://www.home-assistant.io/), [node-red](https://nodered.org/), [kuma](https://uptime.kuma.pet/), and more... They rely on a local DHCP server that lives in a secondary router, so when that router can't get Internet, nothing works: we don't have a doorbell, our blinds don't roll, our garden doesn't get watered, our heat pump does not trigger... Reconfiguring all this would be absolutely hellish.

<img src="/images/posts/network_broken.png" alt="Broken network diagram" style="display: block; margin: 0 auto; text-align: center;">

## Solution: the single responsibility principle

There was a simple solution to all this: we purchased [a 4G router](https://www.amazon.com/dp/B07RM95YFC) to act as an Internet gateway, in stead of our regular fiber router. This router works by inserting a SIM card, and connects to the Internet via the 4G network, like smartphones do, but other than that it acts like any regular router. 

Because the responsibility of the main router in our case is limited to just be a dumb proxy for internet access, it's completely replaceable: we can choose to use the fiber or 4G router as Internet provider as the need arises. The rest of the network setup remains intact, and our house can keep business as usual during the outage with zero effort.

<img src="/images/posts/network_fixed.png" alt="Fixed network diagram" style="display: block; margin: 0 auto; text-align: center;">

In order to keep using my phone normally, I requested a [multi-SIM](https://en.wikipedia.org/wiki/Multi-SIM_card) to my network operator, so that I could have two SIM cards with the same account, one on my phone and another one on the 4G router. 

The 4G connection is obviously not as good as the fiber, and we're still limited to 100GB per day. But by cutting downloads and streaming we get a near-normal Internet experience until the fiber can get fixed.

<div class="img-with-text" style="display: block; margin: 0 auto; text-align: center;">
    <img src="/images/posts/spaghetti.jpg" alt="spaghetti cables" >
    <p>If you dread spaghetti code, try spaghetti cables</p>
</div>

Then we simply swap the entry routers again, and it's as if nothing ever happened.


