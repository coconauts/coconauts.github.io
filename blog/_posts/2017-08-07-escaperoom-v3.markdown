---
layout: post
title: "Escaperoom early access"
date: 2017-08-07 20:00:14 +0000
comments: true
categories: games
tags: unity3d escaperoom html5
sharing: true
keywords: escaperoom,unity3d,html5
description: "Update on escaperoom v3 game made on Unity3D"
author: Javier Rengel
featured: true
published: true
---

A couple of months ago, we showed you [Escaperoom](https://coconauts.net/blog/2017/05/29/bank-holiday-hackday-escape-room-on-unity3d/),
a puzzle game we developed during a hackday. We've continued improving the game after that,
and today we want to show you a first polished prototype.

![3dview](/images/posts/2017-08-07-escaperoom/3dview-1.png)

This is not the finished game yet, but it's a version we consider polished enough 
for playtesting. Give it a go here! http://unity3d.coconauts.net/escaperoom-v3/.
And read on for the geeky details...

<!--more-->

## The procedural puzzles puzzle

After developing the hack, we tried to focus on the final goal of having dinamically generated rooms filled with parametric puzzles and multiple inputs/outputs; a sort of "roghelike puzzler". We successfully wrote a first pass at an algoritm to
generate puzzle dependency charts, which was kind of convincing. However, we soon realized that it was difficult to
integrate the puzzles in a contextually coherent way.

Allow me to expand on this. Imagine you have a locked laptop, and to get the password you need to call a certain
telephone number, and the phone number shows up on a phone guide. If order for the player to make the connection, we 
need to provide some context in the phone guide, such as the logo of your laptop. This is easy to do if you are 
designing a static puzzle. However, in our case we have a generative algorithm that picks and matches clues and keys
with containers to hold them. In that way, the phone guide might be used to display any phone number, be it one to give out
the laptop password or another one to give you the color of a cable to cut.

![phoneguide](/images/posts/2017-08-07-escaperoom/phoneguide.png)

However, it's not a simple as it sounds. If you simply see a phone number with no context, you won't be able to know 
where to use it, and the puzzle won't be fun. That's why we need to provide context alongside the phone number, that
will change depending on the generating puzzle (eg, the tech support service or the electrician), which might several
levels above in the puzzle dependency graph.

Our algorithm is not that smart yet. So we can get numbers and keys distributed, but without context, it is not fun.
To bring back the fun, we decided to step back and design a static puzzle to begin with, and we'll see into randomizing it later (or not!).

## Improvements 

So eventually, we decided reuse the puzzle design we crafted for the hackday, with mainly UI improvements.

![room graph](/images/posts/2017-08-07-escaperoom/graph.png)

These are all the new features of this new version: 

* Text dialogs: usually by clicking in objects you will see some text , describing the object, and sometimes clues.
* First person view and movement for the main room.
* Puzzle hierarchy models, code refactoring, unity3d housekeeping...

![3dview](/images/posts/2017-08-07-escaperoom/3dview-2.png)

We've also experimented with some ideas that didn't make it into this version...

* New puzzles: gears, simon, keypad...
* Augmented reality puzzles: QR codes
* Rotating objects 
* Jigsaw generator (also works with qr codes)
* Zooming objects
* Dinamically generated room

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Dynamically generated gears puzzle for our escape game <a href="https://twitter.com/hashtag/madewithunity?src=hash">#madewithunity</a> <a href="https://twitter.com/hashtag/gamedev?src=hash">#gamedev</a> Very happy with how it&#39;s progressing =D <a href="https://t.co/L3Ycdms7fz">pic.twitter.com/L3Ycdms7fz</a></p>&mdash; Javi Rengel (@rephus) <a href="https://twitter.com/rephus/status/875480874833367040">June 15, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## Conclussions

Is funny how we spent a single day to develop the hackday version, but nearly two monthts (not full time) just on improving the current status and getting rid of the bugs. 

Many of our trials and ideas didn't cut it into this version in the end, but might make it into future ones. We also
want to extend the puzzle to make it approximately one hour long, as escape room games usually are.

What do you think about the game? Were you able to escape the room? What did you like and what would you improve or change?
Your feedback is really valuable to us! so please let us know on the comments or [on twitter](http://twitter.com/coconauts).
