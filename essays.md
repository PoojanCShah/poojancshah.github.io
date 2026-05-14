---
layout: page
title: Essays
---

{% assign sorted_essays = site.essays | sort: 'date' | reverse %}
{% if sorted_essays.size > 0 %}
<div class="essay-list">
{% for essay in sorted_essays %}
<div class="essay-item">
<div class="essay-item-title"><a href="{{ essay.url }}">{{ essay.title }}</a></div>
{% if essay.date %}<div class="essay-item-date">{{ essay.date | date: "%B %Y" }}</div>{% endif %}
{% if essay.description %}<p class="essay-item-desc">{{ essay.description }}</p>{% endif %}
<div class="essay-item-links">
{% if essay.pdf %}<a href="{{ essay.pdf }}" class="btn-pdf" download>PDF</a>{% endif %}
</div>
</div>
{% endfor %}
</div>
{% else %}
<p>No essays yet.</p>
{% endif %}
