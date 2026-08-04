---
layout: page
title: Writing
permalink: /writing/
---

<div class="posts">
{% for post in site.posts %}
  <div class="post">
    <a class="post-link" href="{{ post.url | relative_url }}">
      <h3 class="post-title">{{ post.title }}</h3>
    </a>
    <p class="post-meta"><a class="post-pdf" href="{{ '/assets/writing/pdfs/' | append: post.slug | append: '.pdf' | relative_url }}">[pdf]</a></p>
    {% if post.description %}
      <p class="post-summary">{{ post.description }}</p>
    {% endif %}
  </div>
{% endfor %}
</div>
