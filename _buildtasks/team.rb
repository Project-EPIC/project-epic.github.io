require 'yaml'
require 'rails'

class Person
	#Making this a class so that we can run validations/substitute defaults, etc.
	attr_accessor :name, :role, :url

	def initialize(name)
		@name = name
	end
end

def write_team_file(people, filename)
	to_write = []
	
	people.each do |member|
		this_member = {}
		member.instance_values.each do |k,v|
			unless v.nil?
				this_member[k]=v
			end
		end

		to_write << this_member
	end
	p to_write
	
	File.open(filename, 'wb') {|f|
		f.write(to_write.to_yaml)
	}
end