---
layout: page
title: Project Epic
tagline: Empowering the Public with Information in Crisis
---
{% assign post = site.posts.first %}

<!--This is the front page image slider-->
<script type="text/javascript">
$(document).ready(function(){
  $('#Div_Slider_Test').bxSlider({
    auto: true,
  	captions: true,
    controls: false,
    pager: false,
  	adaptiveHeight: true,
  	responsive: true
  });
});
</script>

<ul id="Div_Slider_Test">
<li><div>
<h3>This is the first slide</h3>
<p>We can put information here, like a person or a publication</p>
</div></li>

<li><div>
<h3>This is the second slide</h3>
<p>I will put different information here.</p>
<a href="http://www.google.com">This is a link to google</a>
</div></li>

<li><div>
<h3>Lorem Ipsum</h3>
<p>I should get some lorem ipsum to go here.</p>
</div></li>

<li><div>
<h3>Buffalo Buffalo Buffalo buffalo Buffalo</h3>
<p>A complete sentence consists of 7 Buffaloes, who knew?</p>
</div></li>
</ul>

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
