require 'yaml'
require 'rails'

#Global Vars:
file = "./_data/team.yml"	#Note, must call this as a rake task, not directly
team = []

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

################### Test case
test_members = [
	{:name => "Robert Soden", :role => :student, :url => "http://www.google.com"},
	{:name => "Leysia Palen", :role => :professor, :url => "cs.colorado.edu/~lpalen"},
	{:name => "Jennings Anderson", :role => :student},
	{:name => "Jo White", :role => :student, :url => "http://www.google.com"}
]

test_members.each do |member|
	this_member = Person.new(member[:name])
	this_member.url = member[:url]
	this_member.role = member[:role]
	team << this_member
end

####################


write_team_file(team, file)