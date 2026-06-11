---
layout: page
title: Expository Writings
permalink: /expository-writings/
---

{% assign writings = site.posts | where_exp: "post", "post.expository == true" %}
{% assign sorted_writings = writings | sort: 'date' | reverse %}
{% if sorted_writings.size > 0 %}
<div class="essay-list">
{% for post in sorted_writings %}
<div class="essay-item">
<div class="essay-item-title"><a href="{{ post.url }}">{{ post.title }}</a></div>
{% if post.date %}<div class="essay-item-date">{{ post.date | date: "%B %Y" }}</div>{% endif %}
{% if post.description %}<p class="essay-item-desc">{{ post.description }}</p>{% endif %}
</div>
{% endfor %}
</div>
{% else %}
<p>No writings yet.</p>
{% endif %}
