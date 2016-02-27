---
layout: post
title: "Exploding Bunnies"
date: 2015-03-21 15:53:19 +0000
comments: true
categories: games
tags: libgdx android game timebomb
sharing: true
keywords: libgdx,android,game,classic,8bit,bunnies,bombs,free
description: "New exploding bunnies game release, free game for android"
author: Mar Bartolome
featured: false
---

It's been half a year since
[Super Time Bomb](http://www.coconauts.net/projects/timebomb2/)
was released. During this
time, we've been closely following it's reception, and gathering user
feedback. Today we released an update with major gameplay changes,
including a name change!

<!--more-->

## New name

The game is now named *Exploding Bunnies*, in the hope that this is
a more unique name, making it easier to search on the Play Store.
Before it was appearing over the 10th position in the search result,
whereas now it's showing up the forth, you don't even need to scroll
to see it.

<img src="/images/posts/exploding-bunnies/store.png" />

## More fun difficulty curve

We've made the difficulty curve more stable. Previously, the difficulty
in both game modes was set to be strictly incremental: it started
really slow and easy, and difficult went up at a constant rate. But
after a few minutes it turned out to be humanely impossible to survive.
This made for a frustrating experience, with short gameplays, boring time
after every restart, and no incentive for players to try to last longer
and longer, since it was physically impossible.

We've heavily tuned the difficulty curve so that now starts out a little
bit more upbeat, so you won't be bored with every game restart. Then it
goes up  until it reaches a limit at 5 minutes of gameplay, after which
point it will stabilize. This allows for in theory infinite gameplays,
giving the players an incentive to keep trying to beat their high scores.

<img src="/images/posts/exploding-bunnies/difficulty.png" />

## One game mode to rule them all

The original Super Time Bomb included two game modes: wave and continous.
For this revision, however, we've decided to say goodbyde to the wave mode
and keep the continous one. The wave mode wasn't that different from the
continous one, so it was a bit redundant to begin with. The difficulty
curve problem mentioned earlier was also more accused in the wave mode
than in the continous one. It also confused new users trying out the game
to have to pick between two game modes.

So now we have one big "PLAY" button instead, which will take you to
the formerly continous mode gameplay. Unite and conquer!

<img src="/images/posts/exploding-bunnies/mainmenu.png" />

## Death from above

Since we've limited the difficulty in terms of quantity of bombs in the
screen, we've decided to add a new type of bomb to increase the complexity
a little bit. Now, aside from the regular bombs, mines, and wall lasers,
we have a new dropping bomb that falls from the sky. The difference is that
for this type of bomb there is no counter! You'll just see a warning and
a shadow where the bomb will fall.

<img src="/images/posts/exploding-bunnies/airbomb.png" />


## Go play it!

It's difficult to make a star game in your first shot. Usually most
great games come from successive iterations over the same idea (just
have a look at the metal gear games for instance!).

So go and give a try to the new
[Exploding Bunnies](https://play.google.com/store/apps/details?id=net.coconauts.timebomb2)
and see how you like it! Please give us feedback: we welcome every
comment, and we'll try to make the next iteration even better.
