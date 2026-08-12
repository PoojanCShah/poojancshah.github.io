---
layout: page
title: Writing
permalink: /writing/
---

<ul class="writing-list">
{% for post in site.posts %}
  <li>
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    <span class="writing-date">({{ post.date | date: "%Y/%m/%d" }})</span>
    / <a class="post-pdf" href="{{ '/assets/writing/pdfs/' | append: post.slug | append: '.pdf' | relative_url }}">PDF</a>
    {% if post.description %}
      <div class="writing-summary">{{ post.description }}</div>
    {% endif %}
  </li>
{% endfor %}
</ul>
