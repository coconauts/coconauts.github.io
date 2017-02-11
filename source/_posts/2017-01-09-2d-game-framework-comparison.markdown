---
layout: post
title: "2D game framework comparison: Defold vs Phaser vs Game Maker"
date: 2017-01-09 10:42:19 +0000
comments: true
categories: games
tags: 2d framework comparison defold phaser gamemaker
sharing: true
keywords: 2d,framework,comparison,defold,phaser,game maker
description: "2D game framework comparison: Defold vs Phaser vs Game Maker"
author: Javier Rengel
featured: false
published: true
---

We wanted to start a building new 2D game ideas we have in mind, and we thought
our favorite 3D platform so far (Unity3D) was not optimal enough to build a fully 2D game.
And despite having experience with some other frameworks like LibGDX (as we built
[Exploding Bunnies](/projects/timebomb2) ) along with some other Ludum Dare games,
we wanted to see if there is something better.

After some investigation, we narrowed the list to Defold vs Phaser.io vs Game Maker,
 so we decided to give them a try by building a quick Pong demo in those 3 frameworks,
and gather some conclusions before we start building our next 2D game.

<!--more-->

## Defold

Propietary framework made by King (experts on mobile games). They have built a
promising editor with a lot of great features, like version control and easy deployment to multiple platforms.
Although it's still on Beta, it sounds like this might be a trully solid option.

It took me some time to get used to the new concepts like the atlas and the collection, plus all the properties.
After a while, the whole framework reminded me of Unity3D, but simpler.
On the other hand, the current editor, which is based on Eclipse, gave me bad memories;
fortunately they're moving  to a [cloure based editor](http://www.defold.com/roadmap/) now.
I got blocked during almost an hour because of this
[scaled collision object bug](https://forum.defold.com/t/scaling-collision-object-when-game-object-is-scaled-def-521/547)
until I discovered the useful debug option on game settings.

<iframe src='http://html5.coconauts.net/2d-framework-comparison/defold/' width=650 height=350></iframe>

* [Showcase](http://www.defold.com/showcase/)

* Language: Lua

* Getting started: http://www.defold.com/tutorials/getting-started/

<img src='/images/posts/2017-01-09-2d-framework/defold-editor.png'/>

#### Pros:
* Free
* Visual editor
* Available on Linux
* Multiplatform
* Performance
* Version control friendly (+integrated)
* Integrated game analytics

#### Cons:
* Propietary solution
* Still beta
* Found bugs while building demo

* Score:  7 / 10

Get our demo [here](https://github.com/rephus/pong-sample-defold)

## Phaser.io

Pretty popular simple opensource framework  with a great community and tons of examples.

While building this demo, I found it was surprisingly easy to start with,
plus the documentation and the API was very clear and advanced.

Things like `game.world.centerX` instead of doing `game.world.width / 2` or
`body.collideWorldBounds = True` really impressed me.

<iframe src='http://html5.coconauts.net/2d-framework-comparison/phaser/' width=650 height=350></iframe>

* Language: Javascript

* Getting started: http://phaser.io/tutorials/getting-started

* Pong tutorial: https://www.youtube.com/watch?v=3egKs7b86j0


#### Pros:
* Open source (but with a company behind it)
* Available on Linux
* HTML5 (multiplatform)
* Great community
* Version control capabilities

#### Cons:
* No official Visual editor
* No direct Android exporting (cordova/cocoon required)

* Score: 8 / 10

Get our demo [here](https://github.com/rephus/pong-sample-phaser)

## Game Maker

Probably one of the oldests game frameworks and still pretty popular,
I remember using this like 10 years ago, before I knew anything about programming.
And to be honest, it hasn't changed that much since then.

The fact the free version only allows to generate window executables and
that the studio only runs on Windows was conclusive enough,
but also the whole framework is no much different from the others,
if you know programming.

Some of the best indie games have been made with this framework like:

* Spelunky
* Hyper Light Drifter
* Nuclear Throne
* Hotline Miami

* Language: Game Maker Language

* Getting started: http://www.yoyogames.com/learn

<img src='/images/posts/2017-01-09-2d-framework/gamemaker-editor.png'/>

#### Pros:
* Visual editor
* No programming skills required
* Seems to be the indie industry standard

#### Cons:
* Propietary solution
* Windows only editor
* No multiplatform (free version)
* Uses its own scripting language
* Version control issues
* Slow runnable

* Score:  3 / 10

## Conclussions

We decided Phaser.io to be our next 2D framework. Of the 3 it was the faster and easiest to get started with. Defold sounds like with some polish it might be a sounder solution to use for real projects (for example, the mobile export is managed a lot better, or the integrated analytics are a bit plus); but the bugs we found on Defold while building this simple demo scared us a bit. Once it matures we might give it another go, but for now Phaser fits the bill for our purposes.
