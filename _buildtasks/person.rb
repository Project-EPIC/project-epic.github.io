class Person
	attr_accessor :name, :status
	def initialize(name, status)
		@name = name
		@status = status
		puts "Name: #{@name}"
	end
end