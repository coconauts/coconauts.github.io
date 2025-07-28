---
layout: post
title: "Infinify: an infinite discovery mode for Spotify"
date: 2017-05-01 18:13:37 +0000
comments: true
categories: software
tags: music nodejs webdev javascript
sharing: true
keywords: spotify,discovery,infinite,nodejs,javascript
description: "A NodeJS app powering infinite recommendations to a Spotify playlist"
author: Mar Bartolome
featured: false
published: true
---

I'm a Spotify user. I'm not the greatest fan of the user experience they offer, but it's definitely the "lesser evil" when it comes to music streaming.

You see, I'm the kind of person that just cant be bothered to choose, I _loathe_
choosing. Deciding albums to hear? What are we, in the 90s? with phisical CDs that
need popping into a player? It's the digital age! I just want to open Spotify
and be presented with a continuous stream of non-stop music,
wihout having the choose an album, or a genre, or a playlist.
They even require my constant feedback when in radio mode!
(don't even get me started on the Spotify radio, _yuck_).
I just want a big "play" button and let Spotify use a teeny bit of
machine intelligence to feed me stuff that it thinks I might like.
Considering the app is sitting on top of a pile of data from me
(listening history, saved collection)... is it really that hard?

Because Spotify is not giving that to me though, we at Coconauts decided to
build it ourselves, using their API and Javascript. The result: Infinify.

![Infinify](/images/posts/2017-05-01-infinify/infinify.png)

<!-- more-->

## What is it?

Infinify is a website with a huge "play" button, that feeds on your
Spotify saved collection to produce a continuous mix of tracks from your
own music plus recommendations.

## How does it work?

Spotify exposes [a very powerful `/recommendations` endpoint on their API](https://developer.spotify.com/web-api/get-recommendations/),
which I reckon plugs into [the same magic that is powering their discovery modes](https://qz.com/571007/the-magic-that-makes-spotifys-discover-weekly-playlists-so-damn-good/).

The `/recommendations` endpoint instantly gives you a list of recommended tracks,
given a seed of a list of songs, artists or genres. You can even tune a bunch of
crazy parameters, such as _danceability_, _energy_ or _popularity_. It's quite amazing.

The problem though is that the recommendations output is finite (capped at 100 results),
whereas we want a continuous flow of recommendations.

Another problem with it, which is also noticiable in their discovery modes,
is that it tries too hard to give you music that is similar to _all_ of your seeds.
Wha this means is: if you seed it with some classical music, heavy metal and jazz,
it's going to try to return tracks that are strange chimaeras mixing all of those
traits, rather than giving you a mixed bag of more conventional tracks in those genres.
In other words: it's an _and_, not an _or_. Now, this might actually be what you want
in some occasions, but when it comes to recommending music to people it doesn't work:
if I like John Williams and Queen I want to be recommended Danny Elfman and Van Halen,
not "Some Orchestra Plays Very Bland Rock Classics".

![Infinify](/images/posts/2017-05-01-infinify/epicrock.png)

So our solution involves working around the endpoint, using in a bit unorthodox way:

1. Fetch a random single song from the user's saved music collection.
2. Use this song's artist as a seed to the `/recommendations` endpoint. Get a small X number of songs back.
3. Pick a random song from the response, and add it to a playlist.
4. Repeat the above every 2 minutes.

In this fashion, the result is a Spotify playlist that is continuously growing
with fresh recommendations (for as long as the the website remains open).

We use the artist as a seed, rather than the song, so that you can still get
a chance of getting the songs you already have in your library and love.

The seed is started from a single song to try to get purer recommendations, rather
than strange blends. We then produce X recommendations and pick one. Why?
Well, we experienced that the first item in the results is always a song by the
same artist that your seed, and this doesn't give you much variety. So by producing
several and then picking one of them, you get a delicious balance: you'll get a
certain chance to get songs by the same artists in your library, but them a slightly
bigger chance to get related artists (that may or not be in your library).

This X number of tracks is what we call the _discoverability_ parameter, and
you can toggle it between 1 ("I just want the artists I know and love") and 10
(in which approximately 9 in every 10 songs will be new, and 1 will be familiar).

![Infinify](/images/posts/2017-05-01-infinify/discoverability.png)

## The ugly bits

Unfortunately there are some limitations that make the user experience a bit rough.
For starters, the fact that you need to have an external web application to start
the infinfy playlist. Spotify [scrapped their in-app extensions](https://developer.spotify.com/technologies/apps/) some years ago,
so the only way to add integration nowdays is by keeping them completely external.

It would be possible to stream the audio directly to the webapp, but only 30-second
samples: not acceptable. So you need Spotify for playback, and the webapp for the
integration.

You can at least [control the playback on a device via the API](https://developer.spotify.com/web-api/start-a-users-playback/), you need to
have a premium account for that. So if you don't, you need to hit the play button
twice: once on infinify, once on the app.

Another uglyness is that we found no way via the API to be able to track the
listening progress of the user on the playlist. This made it quite difficult to
determine when we should add and remove tracks from the playlist.
After trying some nasty kludges, we decided for a straigghtforward solution:
just add new songs every 2 minutes, and keep the old ones there. They don't
bother you after all! (in fact, its kinda nice to have a record of your
listening session) and there's no problem on Spotify even if the playlist
gets absurdly long.

The only edge case is if you run out of songs in the
playlist: for this eventuality we added a little `(+)` button to force a manual
generation. When you start a new session the playlist gets reset, as it would be
confusing to have the long list of tracks from last time.

<iframe width="560" height="315" src="https://www.youtube.com/embed/_ge4n9zmTRQ" frameborder="0" allowfullscreen></iframe>

Because the way we are abusing the `/recommendations` endpoint, ours is
not the most rate-friendly solution. However, it's also not that bad: our load
is 4 or 5 requests every 2 minutes, which still falls within reasonable limits,
at least if we keep it to only one user.

## Final remarks

For recommender engines, and in general many AI problems, there's usually
a rule: a naive, straightforward solution can take you 60-80% there.
Then any increases on that number will require years of PhD research.

Infinify is a very simple solution, but surprisingly, also very effective! I was
very pleased with the quality of recommendations, and how you can still get
a mix of familiar and new. Of course, most of the
heavy lifting comes from the magic behind the `/recommendations` engine,
but I'm happy that we could bend it to overcome it's limitations.

For now, I intend to use it heavily for a while and see if it still satisfy me,
or if recommendations start getting a bit repetitive. In such case, I might start
tunning the algorithim to try more variability (for instance, going for
multi-level recommendations from recommendations).

You can get the code for Infinify [on Github](https://github.com/coconauts/infinify).
