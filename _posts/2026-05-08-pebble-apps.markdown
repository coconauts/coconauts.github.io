---
layout: post
title: "Making pebble apps in 2026"
date: 2026-05-08 00:00:00 +0000
categories: hardware
tags: pebble hardware smartwatch
sharing: true
keywords: hardware
description: "The Pebble smartwatch is back, and we've been building apps for it"
author: Mar Bartolome
featured: false
published: true
---

'Member [Pebble](https://www.kickstarter.com/projects/getpebble/pebble-e-paper-watch-for-iphone-and-android)? It was one of the first smartwatches in the market, and in my personal opinion, the only one that got the concept right: it was minimal, efficient, and tinker-friendly. People could program apps for it, just like with a smartphone. Pebbles were so popular back in the day that the company died of success: took up too much investment, and ended up being bought by Fitbit, who [officially discontinued the project in 1016](https://web.archive.org/web/20180705003113/https://blog.getpebble.com/2016/12/07/fitbit/).

The community around Pebble was naturally disappointed, to the point that a group of enthusiasts (who called themselves ["the Rebble Alliance"](https://rebble.io/)), found a way to keep their watches alive by building their own replacement of the online services and app store, and scraped all of the existing watch apps and faces before the official ones were shut down. But ultimately, our devices ended up dying of old age.

Then last year, Pebble's original author announced [that they were resurrecting the project](https://ericmigi.com/blog/why-were-bringing-pebble-back/): and there was much rejoicing! Production took a while, but as of today you can [buy a brand new Pebble watch](https://repebble.com/). And whatsmore: they imported all of the old archive of apps and faces rescued by Rebble into [the new app store](https://apps.repebble.com), which are still compatible with the new watches. A success story in digital preservation!

Recently, there was a [official app-making contest](https://repebble.com/blog/spring-2026-pebble-app-contest) which served as the perfect excuse to build [a couple of apps ourselves](https://apps.repebble.com/apps/dev/coconauts_1e79b46fb4a32ceee9259940). 

<img src="/images/posts/pebble/neko_IRL.gif" alt="Neko watchface on a pebble watch" style="display: block; margin: 0 auto; text-align: center;">

<!--more-->

## Neko wristmate

<img src="/images/posts/pebble/pebble_neko.gif" alt="Neko watchface screenshot" style="display: block; margin: 0 auto; text-align: center;">

Mar built a watchface (ie, an app whose purpose is to run as the main display of the device) featuring an animated [Neko screenmate mascot](https://en.wikipedia.org/wiki/Neko_(software)), alongside the time and date. The Neko will play around for a bit, and fall asleep after a while. It will wake up on a tap event (eg, when you tap the watch or do a wrist-turn movement).

- [Pebble app store](https://apps.repebble.com/neko-wristmate_4c25df439af543d19c98630a)
- [Source code](https://github.com/coconauts/pebble-neko-watchface)

## 80% battery charged

<img src="/images/posts/pebble/pebble_battery.png" alt="80% battery app screenshot" style="display: block; margin: 0 auto; text-align: center;">

Javi built an app that triggers on charging, and will notify the user when the charge level reaches 80%. This way you can choose to interrupt the charge before reaching 100%, which is useful for preventing long term  battery capacity degradation.

- [Pebble app store](https://apps.repebble.com/80-battery-charged_e7540c9775d545af81ba7f3f)
- [Source code](https://github.com/rephus/pebble-battery-charged)

## Implementation details

Pebble apps used to be non-trivial to build back in the day. They need to be coded in C, and although the SDK provides a lot of helpers, building something minimally complex (eg, with animations, or interactions) was cumbersome and error prone. 

Today this process is a lot easier if you enlist your AI agent of choice as a helping hand. We've built ours using Claude and [the official Pebble-development skill](https://github.com/coredevices/pebble-watchface-agent-skill).

Even if you use a clanker for the heavy lifting, it's a good idea to manually go though [the official tutorial](https://developer.repebble.com/tutorials/watchface-tutorial/part1/) first, which helps you familiarize with several low-level pebble concepts that ure useful to know when designing your apps. 

An important point to consider is that there are a lot more Pebble models now that there were back in the 2010s, each with different characteristics. For example: different screen resolutions, colored or black-and-white displays, or the newest model even has touch support. The SDK designates each of them as a _platform_ with a codename (see [the relevant docs](https://developer.rebble.io/guides/tools-and-resources/hardware-information/)).

In our case, we initially created our apps with our watch model as the target platform (_flint_ for Pebble 2 Duo), and afterwards added tweaking for others, with the help of Claude. You can use [the provided emulators in the SDK](https://developer.rebble.io/guides/tools-and-resources/pebble-tool/#installing-watchapps) to test how it would look in each different platform.

## More than just apps

Pebble is under very active development at the moment, so the landscape is changing very quickly with new and exciting capabilities. There's [a cloud IDE](https://cloudpebble.repebble.com/) with integrated SDK and emulators, new models with touch capabilities and compatible with [apps developed in JS](https://developer.repebble.com/tutorials/alloy-watchface-tutorial/part1/), and there's a [companion smart-ring](https://repebble.com/index) that is currently in the works. 

But the best part of it is that this time [absolutely everything is open sourced](https://ericmigi.com/blog/pebble-watch-software-is-now-100percent-open-source/), even the firmware and hardware schematics. This is great news, as it allows the community to get involved in ways other than simply writing apps, but also guarantees that this time pebble will not go away as easily as before, even if the Core Devices company ceases its operations. 

We're very excited about the Pebble comeback and their new direction, and if our time allows we'll continue to develop more apps for the platform in the future.
