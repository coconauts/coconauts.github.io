---
layout: post
title: "Retrophies: Achievements System for Emulators"
date: 2016-08-01 20:54:19 +0000
comments: true
categories: games
tags: games software emulation games retro
sharing: true
keywords: retro,emulation,trophies,achievements,game genie,hack,rom,games,mario
description: "Introducing Retrophies, a system to implement achievements on game emulators"
author: Mar Bartolome
featured: true
published: true
---

Play now at [retrophies.win](http://retrophies.win)!

If there’s one thing that has become a de-facto standard in the gaming industry during the last decade this is game achievements, trophies, or whatever you may call them. Not only on console games, but Apple and Android also provide facilities to integrate this features in games published on their platforms. Many games even implement a custom achievements system specific for that game in isolation.

There seems to be an exception though. Retro games. Obviously a game from 20 years ago was not designed with achievements in mind, but even when companies re-edit old games, they seem to be happy enough charging you current day prices for what it is often an effort-less dump of the classic game, which you may even wonder if they’re running though an emulator. Do you expect the new [mini-NES](https://www.nintendo.com/nes-classic) will be anything more than this?

At Coconauts we love classic games, as well as emulators. So we’ve wondered… how would it be if your favourite emulators had some of the functions of today’s game platforms, like achievements?

This what Retrophies is trying to achieve. And for the first proof of concept we’re bringing achievements to Super Mario Bros.

<!--more-->
You can see Retrophies in action [here](http://retrophies.win). A rom of Super Mario Bros for NES is running on a forked version of JSNES, implementing Retrophies. If you play for a little bit, you should start seeing some notifications for unlocking some achievements, after certain events occur in the game. How many can you get?

<img src="https://farm9.staticflickr.com/8674/28062483653_c8da6e86ea_z_d.jpg" alt="achievement">

You may be wondering how all this works. No romhacking is involved, or at least not in the game rom itself. Retrophies is nothing more than a collection of memory registers and values. The emulator implementing Retrophies needs to be constantly inspecting those register in the running game RAM. When the correct value is up, the achievement should be triggered.

```
var achievements = [
    //[Memory (0), Value (1) , Title (2), Description (3), Img (4), Triggered (5)]
    [0x0770, 1, "Enjoy Retrophies", "Play Super Mario Bros", "mario", false],
    [0x0748, 10, "Gold mine", "Collect 10 coins", "coin", false],
    [0x075A, 7, "More lives than a cat", "Get 8 lives", "1up", false],
    ...
]
```

As you see, the system itself is quite simple. The difficult part comes when figuring out the list of memory values that should trigger achievements. This of course has to be custom-tailored for each individual game, in a reverse engineering process of trial and error, similar to what it takes to discover cheat codes for Game Genie.

Game-hacking utilities come handy for this task. The SMB achievements were obtained using an emulator called FCEUX, which [comes with a good bunch of tools](http://www.fceux.com/web/help/fceux.html?ROMHacking.html) used by rom hackers, or speedrunners. Particularly useful for our purposes are a [real time hex editor](https://www.youtube.com/watch?v=jfnqxxwlIyo)(pictured below) or the [RAM search tool](http://tasvideos.org/EmulatorResources/RamSearch.html).

<img src="https://farm9.staticflickr.com/8835/28600323071_60e66949c8_z_d.jpg" alt="fceux">

We can also take advantage of the [plenty of already existing game cheat codes](http://gamehacking.org/game/31010) that people have already deciphered for the game. If we have a cheat code for invincivility setting a particular value in a particular register, we already know the register and the value that we have to inspect if we want to trigger an achievement when getting an invincivility star. There are different formats for game codes, but there are conversors around that will map them in the end to one or several memory locations.

Our Retrophies implementation has only been done for now on the JSNES emulator, as a proof of concept. However, as the system is very simple, as well as [open source](https://github.com/rephus/retrophies), it should be easy for other emulators to implement. Achievement codes can also be obtained for any ROM, given some time and dedication. Watch this space for further news.
