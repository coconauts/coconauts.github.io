---
layout: page
title: "StarCraft Unity3D"
comments: true
sidebar: true
sharing: true
footer: true
---

We have been just _playing_ with Unity3D for a few months, but we have already tried to build something: a new RTS (Real Time Strategy) game for Desktop and Mobile. But we want to make this game abstract and adaptable, so that it works like an engine, which means we could easily change the models, behaviour and statistics from the objects in the scene to make a completely new game, a clone of [Star Wars Galactic Battlegrounds Clone Campaings](https://www.youtube.com/watch?v=0Wkrd594k4k) maybe ? or maybe completely new strategy game featuring plants vs zombies, pirates vs ninjas, angels vs demons or monkeys vs giraffes.

<img src='https://farm2.staticflickr.com/1636/24079670424_3275b9c5f1_z_d.jpg'/>

In our case, we've started by using the 3D models, animations from StarCraft II game
and reverse engineered the behaviour of this game to make our strategy game template.

<img src='https://farm2.staticflickr.com/1502/24614331371_6e4c44e84e_z_d.jpg'/>

Please note that this is just a technical demo and it's not made to replace
StarCraft or make any money with their work in any way, we are just trying to follow their path because we love this game.

<iframe width="100%" height="450" src="https://www.youtube.com/embed/MqGj5grWYG8" frameborder="0" allowfullscreen></iframe>

## What we have achieved

This is the list of features we have developed to simulate a basic gameplay from Starcraft.
They together implement the featureset from StarCraft games, but it can be easily applied to fit any other strategy gameplay. Do you want to have 4 different resource types instead of 2 like in SWGB ? just update the Resources class and you're done.

<img src='https://farm2.staticflickr.com/1534/24707844895_74afa1c9af_z_d.jpg'/>

* 3D models and animations
* Background music, sounds and reactions (_For Adun!_)
* Buildings and units training queue
* Special building behaviour (like gas extractor or supply depots)
* Ground and flying units (Zerg and Terran)
* Researches
* Resources (Mineral, gas and supplies)
* Import maps using image heightmap
* Mouse and touch controls
* Camera movement and zoom
* Completely new simple interface for touch devices
* New survival gameplay mode
* Basic AI
* Minimap
* Pathfinding (using free A* pathfinding)

<img src='https://farm2.staticflickr.com/1452/24681642176_2a5f191b10_z_d.jpg'/>

## What is missing

This are things we haven't build for this prototype but we will probably do in the future.

* Multiplayer mode
* Better AI
* Local avoidance
* Protoss
* More units and buildings (like bunkers)
* Wireframe support on OpenGL devices or equivalent
* Unit visibility filter
* Team coloring
* Healing units, shields or Zerg restoration feature.

## Source code

On [github](https://github.com/coconauts/startcraft-unity3d).