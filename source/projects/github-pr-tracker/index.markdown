---
layout: page
title: "Github PR tracker"
comments: false
sidebar: true
sharing: true
footer: true
---

Sometimes I feel like following changes on PRs on Github is a bit confusing and/or verbose, even with the existing [Github notifications](https://github.com/notifications)
 or [Github pulls](https://github.com/pulls) interfaces, sometimes the best way was to check your email inbox.

So I decided to create my own [Github PR tracker](https://github.com/rephus/Github-PR-tracker)
for my own Pull Requests, but also for those that I'm assigned to.

![github pr tracker](/images/posts/2017-03-27-github-pr-tracker/screen.png)

## Features

* Group pull requests by title, that will allow me to easily visualize changes related between microservices (in different github repos)

* Visual "Red dot" on those Pull requests that have been updated since you refreshed the page:
comment added, commit made, opened pull request...

* Get quick access to all your relevant PRs, only pin this page on your browser,
and forget about dozens of opened tabs or bookmarks.

## How to use

First pull the repo from [here](https://github.com/rephus/Github-PR-tracker).

Then you need to create a
[Github personal access token](https://github.com/settings/tokens)
and use it on the input text on the search (or modify the index.html to add the default value)

Easy and simple.
