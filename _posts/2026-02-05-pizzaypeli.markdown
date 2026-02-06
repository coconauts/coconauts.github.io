---
layout: post
title: "Pizza&Peli: personal movie session planner and tracker"
date: 2026-02-05 00:00:00 +0000
categories: software
tags: django webdev movies
sharing: true
keywords: webdev
description: "We built our own personal movie session planner app"
author: Mar Bartolome
featured: false
published: true
---

At home we do a weekly movie session with the kids, which is met with high anticipation. But we're not the kind of folks that just pop open Netflix of Disney+ and watch whatever is there - no, we take our children's education seriously, and as hopeless geeks, that obviously includes carefully curating the selection of movies we consume, so that we expose them to cinematic gems at an age-appropriate rate.

We used to just keep a list in [Obsidian](https://obsidian.md/) with movie ideas as they came along, but as the list grew longer it became difficult to manage. Also, often other parents ask for recommendations on which movies we've watched and liked, but we had to rely on our memory to recall them.

So, we've built an app to manage both usecases: Pizza&Peli. 

<div class="img-with-text" style="display: block; margin: 0 auto; text-align: center;">
    <img src="/images/posts/pizzaypeli/pizzaypeli.png" alt="Pizza&Peli app screenshot" style="max-width: 600px; width: 100%;">
    <p>Named after the way we call our movie sessions at home 🍕</p>
</div>

<!--more-->

It's a [Django app](https://www.djangoproject.com/) that uses [scraped metadata from iMDB](https://github.com/tveronesi/imdbinfo), and allows to keep track of the upcoming and previously shown movies in our home sessions. We self-host it in our home server, and pop it up every time we have a new idea for a movie to add to the list, and also to keep of what movies we've watched and when.

[The source code is on Github](https://github.com/coconauts/pizzaypeli). Currently it's an MVP, but we plan to add more features, like trailers, PG rating, or multiple accounts (so we can use it to keep track of our grown-up movie sessions too).

The app was developed as an experiment to code with the aid of [claude code](https://code.claude.com/), which allowed for a much faster development than if it would have been written from scratch. I've kept [a log of the evolution of the app](https://github.com/coconauts/pizzaypeli/blob/main/claude_log/prompts.md), with prompts and screenshots.
