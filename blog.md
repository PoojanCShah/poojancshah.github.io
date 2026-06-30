---
layout: page
title: Blog
permalink: /blog/
---

<div class="posts">
{% for post in site.posts %}
  <div class="post">
    <a class="post-link" href="{{ post.url | relative_url }}">
      <h3 class="post-title">{{ post.title }}</h3>
    </a>
    <p class="post-meta">{{ post.date | date: "%B %-d, %Y" }}</p>
    {% if post.description %}
      <p class="post-summary">{{ post.description }}</p>
    {% endif %}
  </div>
{% endfor %}
</div>
