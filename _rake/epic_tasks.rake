desc "Get Publications"
task :publications do
	puts "Generating Publications YAML file"
	require "./_buildtasks/publications"
end

desc "Get Team"
task :team do
	puts "Generating Team YAML file"
	require "/Users/jenningsanderson/Dropbox/jekyll/epic/_buildtasks/team.rb"
	
	################### Test Case ###############
	team = []
	test_members = [
		{:name => "Robert Soden", :role => :student, :url => "http://www.google.com"},
		{:name => "Leysia Palen", :role => :professor, :url => "http://cs.colorado.edu/~palen/"},
		{:name => "Jennings Anderson", :role => :student, :url => "http://www.townsendjennings.com"},
		{:name => "Jo White", :role => :student, :url => "http://www.google.com"}
	]

	test_members.each do |member|
		this_member = Person.new(member[:name])
		this_member.url = member[:url]
		this_member.role = member[:role]
		team << this_member
	end

	#############################################
	file = "/Users/jenningsanderson/Dropbox/jekyll/epic/_data/team.yml"	#Note, must call this as a rake task, not directly
	p write_team_file(team, file)
end

desc "Full Refresh & Build"
task :fullbuild do
	puts "Doing a full build of the website:"
	puts "TODO"
end

desc "Serve Full Site from Localhost"
task :localpreview do
	puts "Building site..."
	system ("jekyll build")
	puts "Copying to localhost"
	system ("cp -r -v _site/* /Library/WebServer/Documents/")
end