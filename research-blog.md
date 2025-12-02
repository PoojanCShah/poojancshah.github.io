---
layout: page
title: Research Blog
---

{% assign research_posts = site.posts | where: "category", "research" %}

{% for post in research_posts %}
<div class="pub-item">
<div class="pub-title"><a href="{{ post.url }}">{{ post.title }}</a></div>
<div class="pub-venue">{{ post.date | date: "%B %d, %Y" }}</div>
</div>
{% endfor %}

{% if research_posts.size == 0 %}
<p>No posts yet.</p>
{% endif %}
