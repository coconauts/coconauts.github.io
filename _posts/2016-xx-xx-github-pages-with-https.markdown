---
layout: post
title: "Host your blog in github pages with HTTPS"
date: 2016-04-13 20:51:00 +0000
comments: true
tags: blog github octopress https ssl
sharing: true
categories: software
keywords: blog,github,octopress,https,ssl,github pages
description: "Host your blog with octopress in github pages with HTTPS / SSL"
author: Javier Rengel
published: false
featured: false
---

We recently moved [our blog](http://coconauts.net) from our own server to github pages,
as it supports [Jekyll](https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/)
which is what we use on Octopress.

At the beginning, it was good, performance was OK and Github is more reliable than our own -crappy- server;
but after a few weeks we realised that our visits decreased by 50% on organic search.

You can see the drop on number of sessions between 14th March and 28th March on
both Google Analytics and Amplitude Analytics:

<img src='https://farm2.staticflickr.com/1644/26413424105_4abfe0c2ee_m_d.jpg'/>
<img src='https://farm2.staticflickr.com/1683/26387498486_09dd679d27_m_d.jpg'/>

Our site was virtually the same, just hosted on Github pages, so the content didn't changed.
Suddenly we remembered all the news about [boosting sites on Google search by using HTTPS](https://webmasters.googleblog.com/2014/08/https-as-ranking-signal.html) which is something that
Github doesn't support (yet), so we decided to redirect to Github pages using our own SSL certificate on our
machine with a pretty simple Nginx configuration:

```
server {
  listen         80;
  server_name    coconauts.net www.coconauts.net;
  return         301 https://$server_name$request_uri;
}

server{

  listen 443 ssl;
  server_name coconauts.net www.coconauts.net;

  ssl_certificate certificate.pem;
  ssl_certificate_key privkey.pem;
  ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers         HIGH:!aNULL:!MD5;

  location / {
    proxy_pass http://coconauts.github.io;
    proxy_set_header Host coconauts.github.io;
    proxy_redirect https://coconauts.github.io https://coconauts.net;
    proxy_redirect http://coconauts.github.io https://coconauts.net;
  }
}

```

After the SSL change, we started recovering the visits to our site.
Let's see how it goes in the next few weeks.
