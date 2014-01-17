class Press
	attr_accessor :name
	def initialize(name, role)
		@name = name
		puts "Article: #{name[0..45]}..."
	end
end