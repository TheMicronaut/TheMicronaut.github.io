---
layout: page
title: Archive
excerpt: "An archive of blog posts sorted by date."
---

{% for post in site.categories.blog %}
  {% capture currentyear %}{{post.date | date: "%B %Y"}}{% endcapture %}
  {% if currentyear != year %}
    {% unless forloop.first %}</ul>{% endunless %}
    <h1>{{ currentyear }}</h1>
    <ul class="post-list">
    {% capture year %}{{currentyear}}{% endcapture %} 
  {% endif %}
    <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></article></li>
{% endfor %}


<ul class="post-list">
{% for post in site.categories.blog %} 
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></article></li>
{% endfor %}
</ul>