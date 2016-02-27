---
layout: post
title: "Coconauts CI, a lightweight CI built on NodeJS"
date: 2016-02-04 23:00:00 +0000
comments: true
tags: nodejs,ci,redis
sharing: true
categories: software
keywords: coconauts,ci,nodejs,continuous integration,raspberry pi,jenkins
description: "Coconauts CI, a lightweight CI built on NodeJS for Raspberry PI"
author: Javier Rengel
published: true
featured: true
---

CIs are good, as soon as your projects grow, having a continuous integration software
that manages all your apps and deployments is really useful. We have been using a self-hosted
jenkins instance in our server for a few years already, and we have some
[interesting things with it](/blog/2014/09/09/background-tasks-in-jenkins-ipchange).

However, we have always known that jenkins is too heavy, it consumes too much memory and it
has a slow interface, as it is written on Java.

So we were really looking for a lightweight self-hosted CI that could run easily on a Raspberry PI,
but we couldn't find any existing solution, so we decided to build our own, and it was easier that we expected.

<img src='https://farm2.staticflickr.com/1443/24822031815_fcc099fc04_z_d.jpg'/>

<!-- more -->

This project, called `Coconauts CI` is still an experiment in progress, but we decided to share it
on a early stage.

You can download the project on our Github: https://github.com/coconauts/coconauts-ci

## Characteristics

- Node.js and the [Express framework](http://expressjs.com/) for the backend
- JQuery for the frontend
- Powered by Redis database

## Key features

- Simple 1-page only dashboard
- Easily add or update projects in 2 clicks
- Execute tasks periodically
- Clone and update repositories from git (github , bitbucket, etc)
- Run projects without repository to execute tasks periodically.
- Slack integration using webhooks
- Look at previous build logs

<img src='https://farm2.staticflickr.com/1639/24704187222_47dc02eaaa_z_d.jpg'/>
