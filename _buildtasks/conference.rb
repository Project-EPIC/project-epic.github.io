class Conference
	attr_accessor :name
	def initialize(name, role)
		@name = name
		puts "Conference: #{name[0..45]}..."
	end
end