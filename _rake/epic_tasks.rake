require './_buildtasks/parse_to_yaml'

write_directory = './_data'
data = {
	:in_the_news => 	{ :key 	=> "0Aiwzrc8lx93KdEpoYlZPa2tRU25FT1Fzb2s4Yi16UlE",
				  		:object => "News",
				  		:types  => ['News']},

	:people  => 	{ 	:key    => "0AhQ6tqeOTfwBdFhrTmxXM0oxYkx2Vl9ucXJpd0hQRHc",
				  		:object => "Person",
				  		:types  => ['Faculty', 'Students', 'Alumni']},
}
	# :publications =>{	:key 	=> " -Key TBD- ",
	# 					:object => "Publication",
	# 					:types  => ['Publications']}}

namespace :update do

	desc "Update All"
	task :all do
		data.each do |task, values|
			Rake::Task["update:all:#{task}"].reenable
			Rake::Task["update:all:#{task}"].invoke
		end
	end
	
	namespace :all do
		desc "Update All People"
		task :people do
			data[:people][:types].each do |type|
				Rake::Task["update:people"].reenable
				Rake::Task["update:people"].invoke(type)
			end
		end

		desc "Update All Courses"
		task :courses do
			data[:courses][:types].each do |type|
				Rake::Task["update:courses"].reenable
				Rake::Task["update:courses"].invoke(type)
			end
		end 
	end #end all namespace
		
	desc "Update People"
	task :people, :arg1 do |t, args|
		unless data[:people][:types].include? args[:arg1]
		 	puts "Please specify a type, for example: 
			rake update:people[Faculty]
			rake update:people[Students]
			rake update:people[Alumni]
			rake update:people[Researchers]"
		else
			require './_buildtasks/people'
			puts "Generating People YAML file for #{args[:arg1]}"
			
			people = parse_spreadsheet(
				session, data[:people][:object], data[:people][:key], args[:arg1])
			
			write_to_yaml(people, write_directory, args[:arg1])
		end
	end

	desc "Update Courses"
	task :courses, :arg1 do |t, args|
		unless data[:courses][:types].include? args[:arg1]
			puts "Please specify a type, for example: 
			rake courses type=Undergraduate
			rake courses type=Graduate"
		else
			require './_buildtasks/courses'
			type = ENV['type']
			puts "Generating Course YAML file for #{args[:arg1]}"
			
			courses = parse_spreadsheet(
				session, data[:courses][:object], data[:courses][:key], args[:arg1])
			
			write_to_yaml(courses, write_directory, args[:arg1])
		end
	end

	desc "Get Publications"
	task :publications do
		unless ENV['type']
			puts "Please specify a type, for example: 
			rake publications type=test"
		else
			equire './_buildtasks/people'
			type = ENV['type']
			puts "Generating Publications YAML file for #{type}"
			
			pubs = parse_spreadsheet(
				session, data[:publications][:object], data[:pubs][:publications], type)
			
			write_to_yaml(pubs, write_directory, type)
		end
	end
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