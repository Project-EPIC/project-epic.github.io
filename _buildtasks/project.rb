class Project
	attr_accessor :name, :type
	def initialize(name, type)
		@name = name
		@type = type
		puts "Project Name: #{@name}"
	end
end