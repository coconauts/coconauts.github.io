---
layout: post
title: "Add list of featured posts to Octopress"
date: 2015-09-08 19:03:19 +0000
comments: true
categories: software
tags: octopress featured posts plugin ruby template
sharing: true
keywords: ruby,plugin,featured,posts,octopress,template
description: "Add list of featured posts to Octopress"
author: Javier Rengel
featured: true
published: true
---


A few months ago we were requested to add a list of featured posts to an index page in Octopress.
So we did a bit of research about how Octopress + Jekyll + Lyquid template internally works.
And we ended up with a nice solution that you can easily replicate in your own blog.

In this post we will show you how to add your own custom list of featured octopress posts like in [Coconauts](http://coconauts.net#featured-posts)

<!--more-->

The first thing you need to do is to add a new custom tag to your posts, we will call it `featured`

```
---
layout: post
author: Javier Rengel
published: true
featured: true
---
```

Create a new template file called `featured_posts.html` inside your `source/_includes` folder,
with this content:

{% raw %}
```
<div class="row">
   {% assign featured_count = '' %}
   {% for post in site.posts %}
       {% if post.featured and featured_count.size < 3 %}
          {% capture featured_count %}{{ featured_count }}*{% endcapture %}
           <div class="col-sm-4 col-lg-4 column featured-post">
              <a class='post-link' href="{{ root_url }}{{ post.url }}">{{ post.title | titlecase }}</a>
              <p>{{ post.content | strip_html | condense_spaces | truncate:300 }}</p>
           </div>
       {% endif %}
   {% endfor %}
</div>
```
{% endraw %}

Then you can list your three most recent featured posts in every page you want just by adding this code to your markdown or HTML file:

{% raw %}
```
{% include featured_posts.html %}
```
{% endraw %}

Just remember to adapt your HTML code and your CSS to your needs (this one is based on [bootstrap](http://getbootstrap.com/)).

### Featured posts

{% include featured_posts.html %}
