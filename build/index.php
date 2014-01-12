<html>
<body>
<h1>Welcome to the Build Page</h1>
This will eventually be a PHP page that when hit with a specific request it will do the following:
<ol>
<li>Access Google Docs, Retrieve requested form (such as team, publications, etc)</li>
<li>Do any necessary processing, such as scraping Google Doc => Store all in Ruby Hash
<li>Export Ruby Hash as YAML (Because you can do that easily because Ruby is the greatest</li>
<li>Run jekyll build / whatever deployment scripts we have</li>
</ol>
<h4>What do we get from all of this?</h4>
An incredibly simple, easy management process through Google Docs: Update a google doc and click a link:
http://epic.cs.colorado.edu/build/?task=publications and then all is done automagicallly!

<?php
	echo("PHP is running!")
?>
</body>
</html>