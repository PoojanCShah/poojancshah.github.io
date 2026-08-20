---
layout: page
title: Writing
permalink: /writing/
---

<ol class="writing-list" reversed>
{% assign sorted_posts = site.posts | sort: "date" | reverse %}
{% for post in sorted_posts %}
  <li>
    <a class="post-pdf" href="{{ '/assets/writing/pdfs/' | append: post.slug | append: '.pdf' | relative_url }}">[PDF]</a>
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    <span class="writing-date">({{ post.date | date: "%Y/%m/%d" }})</span>
  </li>
{% endfor %}
</ol>
