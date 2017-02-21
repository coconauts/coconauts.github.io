---
layout: page
title: "Retrophies"
comments: false
sidebar: true
sharing: true
footer: true
---

<img src="/projects/retrophies/retrophies.jpg" />

Retrophies is an attempt to bring trophies/achievements to classic console games, running on an emulator. The first prototype implements some achievements on top of the unhacked rom of Super Mario Bros for NES.

The Mario implementation is just a proof of concept, but the principles should be applicable to other roms and emulators. Retrophies just needs the emulator to be able to inspect the game memory in real time (emulators that support Game Genie codes should be capable of this). Retrophies is also scalable to support multiple games and different trophies per game, although creating achievements themselves it's a pretty complex manual process so it might take some time to do.

Achievements are triggered by looking at specific parts of the game's memory in real time, until they match certain conditions. If you are familiar with cheat cartidges, like Game Genie, there's a lot of overlap in how both work. In the same way as cheat codes, In a similar way of how cheat cartridges work, like Game Genie. An effective but complex process, as all the achievements need to be reverse engineered by looking at the memory, one by one.

Retrophies also supports a multiplayer game visualization via Websockets. Every person connected to the game will appear as a Mario sticker. Follow your friends and see their actions. Welcome to the future of retro MMO games!

## Featured on

- [HackerNews (front page!)](https://news.ycombinator.com/item?id=12205560)
- [r/emulation](https://www.reddit.com/r/emulation/comments/4voi81/retrophies_achievements_system_for_emulators/)

## Links

- [Website (with live demo)](http://retrophies.win/)
- [Github](https://github.com/rephus/retrophies)
