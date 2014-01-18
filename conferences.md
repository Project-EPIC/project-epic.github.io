---
layout: page
title: Conferences
weight: 100
group: navigation
---

<ul>
{% for conf in site.data.past %}
	<li>
		<h3>{{ conf.name }}{{conf.desc}}</h3>
	</li>
{% endfor %}
</ul>