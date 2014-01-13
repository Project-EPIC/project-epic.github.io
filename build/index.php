<html>
<body>
<h1>Welcome to the EPIC Website build page</h1>
This will eventually be a PHP page that when hit with a specific request it will do the following:
<ol>
<li>Access Google Docs, Retrieve requested form (such as team, publications, etc)</li>
<li>Do any necessary processing, such as scraping Google Doc => Store all in Ruby Hash
<li>Export Ruby Hash as YAML (Because you can do that easily because Ruby is the greatest</li>
<li>Run jekyll build / whatever deployment scripts we have</li>
</ol>
<h4>What do we get from all of this?</h4>
An incredibly simple, easy management process through Google Docs: Update a google doc and click a link:
http://epic.cs.colorado.edu/build/?task=publications and then all is done automagically!

<h3>Available Tasks</h3>
<ul>
<li><a href='?task=team'>Rebuild Team Page</a></li>
</ul>

<h4>Currently Building:</h4>
<?php
	//Change this directory to the jekyll directory on your local machine (or production server...)
    $jekyll_dir = '/Users/jenningsanderson/Dropbox/jekyll/epic';

	switch ($_GET['task']) {
    case 'team':
        echo ("Team file...<br />");
        echo ("Changing Directory to jekyll root (1 is success)...");
        echo chdir( $jekyll_dir );
        echo ("<br />Calling rake tasks...<br />");
        echo shell_exec("rake team");
        echo ("<br />See Results: <a href=\"/team.html\">Team Page</a>");
        break;
    case 'publications':
        echo "var is pubs";
        break;
    case 'news':
        echo "var is news";
        break;
	}
?>
</body>
</html>