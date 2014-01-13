# Project EPIC Website
This website is built on Jekyll.

### No Database, Yet Very Dynamic Data
Wanting a familiar editing platform, this site pulls data from Google Drive whenever particular rake tasks are called.

These can be called from the /build/index.php page.

### Testing
To test on local machine (must have php running to see build page), modify file paths in the rake files and ruby scripts under _buildtasks then run: ````rake localpreview````

Now the site should be live at <http://localhost>


### Credit Where Credit is Due
Built on Jekyll-Bootstrap, which is released under the [MIT](http://opensource.org/licenses/MIT) license.  For more:  <http://jekyllbootstrap.com>