---
layout: page
title: "Escaperoom"
comments: false
sidebar: true
sharing: true
footer: true
---


Escaperoom is a puzzle game built on Unity3D , mix of Frist person and 2D with a touch of graphic adventure. 

![3dview](/images/posts/2017-08-07-escaperoom/3dview-1.png)

At the moment, the content is static, so the dependency tree of every room is the same. But we'd like to make it generic, so everytime you play, the solution will be different, but so it makes sense.

## Hackday version

![Room](/images/posts/2017-05-29-escape-room/room.png)

Our first approach for this idea was to develop a hackaday version of the game, just to prove the concept and test it is fun to play.

![Graph](/images/posts/2017-05-29-escape-room/graph.png)


- [Blogpost](http://coconauts.net/blog/2017/05/29/bank-holiday-hackday-escape-room-on-unity3d/)
- [HTML5 version](http://unity3d.coconauts.net/escaperoom/)


## v3

![3dview](/images/posts/2017-08-07-escaperoom/3dview-1.png)

 we tried to focus on the final goal of having dinamically generated rooms filled with parametric puzzles and multiple inputs/outputs. Although the code was implemented successfully without too much effort, we realized it was difficult integrate those puzzles in a more logic way. 
 
 So we decided to improve the same room we had, and add all the features we built along the way. 


### Improvements 

So eventually, we decided to just recreate the same room for the hackday, with a few improvements. 

![room graph](/images/posts/2017-08-07-escaperoom/graph.png)

These are all the new features of this new version: 
* Text dialogs: usually by clicking in objects you will see some text , describing the object, and sometimes clues.
* First person room view.
* Puzzle hierarchy models, code refactoring, unity3d housekeeping...

This that we developed, but didn't make into this version: 

* New puzzles: gears, simon, keypad...
* Augmented reality puzzles: QR codes
* Rotate objects 
* Jigsaw generator, also works with qr codes
* Zoom objects
* Dinamically generated room

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Dynamically generated gears puzzle for our escape game <a href="https://twitter.com/hashtag/madewithunity?src=hash">#madewithunity</a> <a href="https://twitter.com/hashtag/gamedev?src=hash">#gamedev</a> Very happy with how it&#39;s progressing =D <a href="https://t.co/L3Ycdms7fz">pic.twitter.com/L3Ycdms7fz</a></p>&mdash; Javi Rengel (@rephus) <a href="https://twitter.com/rephus/status/875480874833367040">June 15, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

- [Blogpost](http://coconauts.net/blog/2017/08/07/escaperoom-v3/)
- [HTML5 version](http://unity3d.coconauts.net/escaperoom-v3/)
