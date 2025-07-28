---
layout: page
title: "Gramola"
comments: false
sidebar: true
sharing: true
footer: true
---

## Description

Gramola is an lightweight online music player, written in pure Javascript.
It plays the music files directly from your server’s hard drive,
and relies only on the directory structure to catalogue them
(not using ID3 tags).

<img src="https://farm2.staticflickr.com/1513/24000467331_46d15821da_b_d.jpg" class="screenshot" />

## Technologies

### Frontend

* Javascript
* Jquery
* Jplayer
* Materialize
* JQuery Open carousel

### Backend

* NodeJS
* ExpresJS
* Sqlite

## Features

### Lightweight

Gramola doesn't require you to have anything else than the NodeJS runtime
to execute. You don't need a database (other than Sqlite, managed by Gramola,
and kept in a single file), you don't need a standalone web server. Gramola's
memory footprint is small enough to run on a Raspberry Pi comfortably.

### File structure before ID3 tags

If there's something true about ID3 tags is that they are most of the time
wrong. We thing relying on them to sort your music collection is not a good
idea. You know how your music is sorted in files and folders, and Gramola
won't mess with that.

### Ready for large collections

Do you have a huge music collection? So do we. And we think a music player
should be able to handle them. Gramola won't take more than a couple seconds
to index several gigabytes of music, and searches or other features will
be snappy as well.

### Multiuser

Several users can create accounts for a Gramola instance. The music
collection is common for everyone, but each user will keep it's own lists
of favourites, blacklists, buckets...

### Responsive interface

Gramola will look neat and be functional no matter your screen size,
even on mobile browsers.

<img src="https://farm6.staticflickr.com/5823/23715269479_f08a124a5f_b_d.jpg" class="screenshot" />

### RESTful API

Everything is built in javascript using the built-in rest api,
providing a friendly and fast front-end experience.

### Quick search

Filter songs and directories in your collection matching a search term.
And it's really quick!

### Favourites, blacklist, and buckets

You can tag your songs in arbitrary "buckets" (for instance:
"party", or "songs from my teens"). Two buckets come by default: Favourites
and blacklist. Blacklisted songs won't come up on infinite modes, but you
can still add them manually to your playlist.

### Random infinite mode

Pick a folder at any level in your directory tree, and start a random
session that will autopopulate the playlist with songs down in the tree as you
go along. You can also start infinite mode from a bucket.

### Share

Share songs and folders using a shortlink parameter (e.g: `?l=29`).
Anyone with the link will be able to reach the song, even if it's not a
user in your Gramola instance.

### What others are listening

The songs others are listening to are recorded in the system,
so you can see what they are listening in your server.

### Desktop notifications

If you activate desktop notifications you will get a popup everytime
the song changes.

### Slide show covers

If you have any album covers on your local collection, Gramola will
display them in a slideshow. If you haven't, Gramola will fetch them
from Google, and allow you to download them locally to your collection.

## Download and source code

Find code and installation instructions on the
[Github repository](https://github.com/coconauts/gramola)
