desc "Run Test build file"
task :test do
  puts "Running Test Rake Task"
  require "./_buildtasks/test_build"
end # task :test


desc "Get Publications"
task :publications do
	puts "Generating Publications YAML file"
	require "./_buildtasks/publications"
end

desc "Get Team"
task :team do
	puts "Generating Team YAML file"
	require "./_buildtasks/team"
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