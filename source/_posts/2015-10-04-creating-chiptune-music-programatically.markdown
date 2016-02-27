---
layout: post
title: "Synthesizing chiptune music programatically"
date: 2015-10-04 19:35:34 +0000
comments: true
tags: gamedev music
sharing: true
keywords: DSP,gamedev
categories: games
description: "A 101 on sound synthesis, applicable to gamedev"
author: Mar Bartolome
published: true
---

We've shown you in the past how to create chiptune-style music both
[with a DAW program](https://coconauts.net/blog/2015/02/02/creating-chiptune-style-music-with-ubuntu/),
and [with old-school trackers](https://coconauts.net/blog/2015/04/19/creating-trve-chiptune-with-a-tracker/).

There's still another way to do it: via code. Particularly suitable for
videogame music in particular, as you can have fine-grained control
over the music that you autogenerate, giving it the ability to be
dynamic.

Every programming language worth their name will have a basic sound
synthesizing library, which will be more than what to need to
make chiptune sounds.

<!--more-->

The basics are these: you'll need something called an oscillator,
which is nothing more than a device (in our case it will be a software
device, but a device nonetheless) capable of generating [basic sound
waves](http://public.wsu.edu/~jkrug/MUS364/audio/Waveforms.htm):
sine, square, triangle and sawtooth.

<img src="/images/posts/chiptune/waveforms.png" />

Then' you'll combine several sound waves together to form your sound.
This technique is known as additive synthesis, and it's illustrated
just below.

<img src="/images/posts/chiptune/additive.jpg" />

Once you have a timbre that you like, the synthesizing library should
have functions to alter its frequency, which will result in
different tones being produced (this is called FM, or frequency modulation,
synthesis), and then you have all you need to make any melody.

There's something that you have to take into account, and is that you
should limit yourself a bit with the kind and number of waves that
you're using, to try to replicate the limitations of the hardware of
old, and thus achieve convincing chiptune sounds.
In [this forum post](http://opengameart.org/forumtopic/kickin-it-old-school-setting-up-nes-style-chiptunes)
the author recommends using nothing more than square, triangle and
sawtooth waves (avoiding sine), and limiting yourself to four
simultaneous instruments (as old sound cards didn't come with many
audio channels). Have in mind though that these are just guidelines,
in practice you should experiment with everything and pick whatever
you think sounds good and convincingly chiptuneish.

Synthesizing your
own game music programatically has several important advantages:
you wont waste any space storing your music assets (when your game is
going on mobile phones this is an important aspect to consider!), and
it allows for unlimited flexibility if your music is going to be
dynamic. So we personally are keen in exploring this approach in a
future game.
