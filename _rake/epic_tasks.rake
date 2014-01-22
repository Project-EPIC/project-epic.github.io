require './_buildtasks/parse_to_yaml'

yml_config = YAML::load(File.open('_config.yml'))
@@site_data = yml_config['google_info']
@@write_directory = yml_config['write_directory']
@@buildtasks_dir = yml_config['build_tasks_directory']

def update_page(type, sheet)
	key = @@site_data[type]['key']
	object_type=@@site_data[type]["object"]

	object_directory = @@buildtasks_dir+'/'+object_type.downcase
	puts "Requiring #{object_directory}"
	require object_directory
	
	puts "Going to Google Drive to Update: "
	puts "\tType: #{type}"
	puts "\tObject Type: #{object_type}"
	puts "\tSheet: #{sheet}"
	puts "\tKey: #{key}"

	objects = parse_spreadsheet(object_type,key,sheet)
	write_to_yaml(objects, @@write_directory, sheet)
	puts "==================================================================="
end

namespace :update do
	@@site_data.each do |symbol, data|
		eval %Q{
			if data["types"].length == 1
				desc "Updates the #{data["types"][0]} page from Google Drive data"
				task data["types"][0].to_sym do
					update_page(symbol, data["types"][0])
				end

			else
				namespace symbol.to_sym do
					data["types"].each do |data_type|

						desc "Updates the #{symbol} page for only specified #{symbol}"
						task data_type.gsub(/\s+/,'_').to_sym do
							update_page(symbol, data_type)
						end
					end
					desc "Update all #{symbol} from Google Drive"
					task :all do
						Rake.application.tasks.each do |t|
  							unless t.name.to_s =~ /:all$/
    							t.invoke if t.name =~ /^update:(#{symbol})/
    						end
    					end
					end
				end
			end
		}
	end #End data iterator

	desc "Run every update task"
	task :all do
  		Rake.application.tasks.each do |t|
  			unless t.name.to_s =~ /:all$/
    			t.invoke if t.name =~ /^update:/
    		end
    	end
  end
end #End namespace

desc "Full Refresh & Build"
task :fullbuild do
	puts "Doing a full build of the website:"
	system ("jekyll build")
	system ("sudo cp -r -v _site/* /var/www")
end

desc "Serve Full Site from Localhost"
task :localpreview do
	puts "Building site..."
	system ("jekyll build")
	puts "Copying to localhost"
	system ("cp -r -v _site/* /Library/WebServer/Documents/")
end

desc "Serve Full Site from Localhost"
task :localpreview do
	puts "Building site..."
	system ("jekyll build")
	puts "Copying to localhost"
	system ("cp -r -v _site/* /Library/WebServer/Documents/")
end