---
layout: page
title: Project Epic
tagline: Empowering the Public with Information in Crisis
---
{% assign post = site.posts.first %}

<div class="frontabout">
	<h3>About</h3>
</div>

<div class="frontourwork">
	<h3>Our Work</h3>
</div>

<div class="frontnews">
	<h3>News</h3>
	<ul class="posts">
    	<div class="post">
			<div class="heading"><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></div>
			<p>{{ post.excerpt }}</p>
			<p>By {{ post.author }}</p>
		</div>
	</ul>
</div>
