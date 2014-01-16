require './_buildtasks/parse_to_yaml'

write_directory = './_data'
data = {
	:in_the_news => 	{ :key 	=> "0Aiwzrc8lx93KdEpoYlZPa2tRU25FT1Fzb2s4Yi16UlE",
				  		:object => "News",
				  		:types  => ['News']},

	:people  => 	{ 	:key    => "0AhQ6tqeOTfwBdFhrTmxXM0oxYkx2Vl9ucXJpd0hQRHc",
				  		:object => "Person",
				  		:types  => ['Current', 'Alumni']},

	:projects   =>	{   :key  	=> "0AihuFDqjCvbedDMzS0FRc1hTT3JVY2lRT2pfekszY3c",
						:object => "Project",
						:types  => ['Projects']},

	:publications =>{	:key 	=> "0Aiwzrc8lx93KdFhudDZDZzdRTkVHQWtpUVNFd01xckE",
	 					:object => "Publication",
						:types  => ['Publications']}
}

namespace :update do
	#Iterate through each data type and define a rake task
	data.each do |symbol, data|
		task symbol.to_sym do
			puts 'called #{data[#{symbol}]}'
		end

		puts symbol, data
	end


	desc "Update All"
	task :all do
		data.each do |task, values|
			Rake::Task["update:all:#{task}"].reenable
			Rake::Task["update:all:#{task}"].invoke
		end
	end

	#Meta programming here to build each independent rake task (?) That would be really cool.
	
	
end #End namespace

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