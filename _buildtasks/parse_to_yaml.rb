require 'google_drive'

def parse_spreadsheet(object_type,key,sheet)
	require './_buildtasks/auth_google_drive' #This gives 'session'
	ws = session.spreadsheet_by_key(key).worksheet_by_title(sheet)
	objects = []

	#TODO: Parse sub-features as lab.name or lab.url  split('.'), then pull first type as key; only capable of one level(?)

	#Assumes that 3rd row is header (Which it is by design)
	(4..ws.num_rows.to_i).to_a.each do |r|	    # Iterate through every row
		object = {}								# Make an empty hash for a person
		(1..ws.num_cols).to_a.each do |c|  		# Iterate over columns, load hash
			object[ws[3,c]] = ws[r,c]
		end

		#Account for empty cells
		if object['name']==""		#As long as name is empty, object doesn't parse
			next
		end

		#Make it a real object of specified type...

						# Metaprogramming required here!
		this_object = eval(object_type).new(object['name'], sheet.capitalize)

		#Now add keys as instance variables to the person... Cool!
		object.each do |k,v|
			unless v==""
				this_object.instance_variable_set("@#{k}", v)
			end
		end

		this_object.validate

		objects << this_object		#Add the object to the objects array
	end
	return objects
end

def write_to_yaml(objects, directory, filename)
	to_write = []
	
	objects.each do |object|
		this_object = {}
		object.instance_variables.each do |k|
			this_object[k.to_s.gsub('@','')] = object.instance_eval(k.to_s)
		end
		to_write << this_object
	end

	#Actually write the file
	begin
		File.open(directory+'/'+filename.downcase+'.yml', 'wb') {|f|
			f.write(to_write.to_yaml)
		}
		puts "file: '#{directory}/#{filename.downcase}.yml' written sucessfully" 
	rescue => error
		puts "Failed to write YAML file:"
		puts error
	end
	
	return to_write
end