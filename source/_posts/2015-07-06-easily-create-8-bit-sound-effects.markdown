---
layout: post
title: "Easily create 8-bit sound effects"
date: 2015-07-06 20:10:17 +0000
comments: true
author: Mar Bartolome
published: true
categories: games
tags: chiptune timebomb music
---

In a past post we've shown you [how to make 8-bit music](https://www.coconauts.net/blog/2015/02/02/creating-chiptune-style-music-with-ubuntu/),
which you might want to use in a game. But of course, if you are having
8-bit music, you'll want your game sound effects to match as well.

In this post we'll show you how to generate 8-bit style sound effects for
for games using a very simple free tool called [bfxr](http://www.bfxr.net/).
No audio or DSP knowledge needed!

<!--more-->

[bfxr](http://www.bfxr.net/) is a generator for 8-bit style sound effects.
It's also completely idiot proof, and you don't even need to install it,
because it's available as a web app (though you can if you want to).

<img src="/images/posts/chiptune/bfxr.png" />

Simply pick a category to generate a randomized sound that
will look legit enough, and the parameters used to synthesize it will
get filled out. In n00b mode you simply keep clicking until just the
right sound appears, and if you're audio savvy you can even tune the
parameters to your will. When you're satisfied, just save the sound in wav
format and you're done.

You'll probably want to do some format conversion with your bfxr
generated sounds though, as wav is an uncompressed format that eats up a
ridiculous amount of space. For this, use any audio converting tool, like
ffmpeg:

    ffmpeg -i audio.wav  -acodec libvorbis audio.ogg

Actually, since we don't care very much about the quality of the audio
(if fact, the lower it is, it will look more authentic!), we can use
the same tool to downsample the track (`-ar` flag sets the sample rate,
and `-ab` sets the bitrate) and turn it to mono (`-ac` flag sets the
number of channels):

    ffmpeg -i audio.ogg -acodec libvorbis -ac 1 -ab 64000 -ar 22050 output.ogg

In this case we've reduced the bitrate to 64k, the sample rate to half the
usual value, and the channels to just one.

The same downsampling process can also be applied to yor 8-bit game music actually.
It shouldn't hurt the music quality and it will noticeably reduce the
size of your assets, something you surely want if you're doing mobile
development.
