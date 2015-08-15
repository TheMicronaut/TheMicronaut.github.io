---
layout: page
title: Blog posts & other stories
excerpt: "An archive of blog posts sorted by date."
hidelogo: true
search_omit: true
---

<ul class="post-list">
{% for post in site.categories.blog %}
  {% capture currentyear %}{{post.date | date: "%B %Y"}}{% endcapture %}
  {% if currentyear != year %}
    {% unless forloop.first %}</ul>{% endunless %}
    <h2 style="font-family: Philosopher">{{ currentyear }}</h2>
    <ul class="post-list">
    {% capture year %}{{currentyear}}{% endcapture %} 
  {% endif %}
    <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></article></li>
{% endfor %}
</ul>