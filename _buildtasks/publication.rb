class Publication
	attr_accessor :name, :role
	def initialize(name, role)
		@name = name
		@role = role
		puts "Name: #{@name}"
	end
end