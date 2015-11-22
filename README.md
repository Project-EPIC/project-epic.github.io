# Project EPIC Website
This website is built with Jekyll and automatically rendered by Github pages.

### No Database, Yet Very Dynamic
The data for the following pages is pulled from Google Drive:

1. People
2. Publications
3. Presentations
4. In The News

These are 4 different google sheets in the ```EPIC Website``` folder on Google Drive. If you can't access it, email Jennings

This is done with the Static-Bliss Gem, to run it, just clone the repository and run ```bundle install```

Then run ```bundle exec bliss``` to list the available functions: 

	The following functions are available based on your configuration:
		bliss update press
		bliss update people
		bliss update people Current
		bliss update people Alumni
		bliss update projects
		bliss update publications
		bliss update presentations

#### Acknowledgements
Original theme from Jekyll-Bootstrap, which is released under the [MIT](http://opensource.org/licenses/MIT) license.  For more:  <http://jekyllbootstrap.com>