class Publication
	attr_accessor :name, :type
	def initialize(name, type)
		@name = name
		@type = type
		puts "Publication: #{name}"
	end


	def validate(params)
		get_categories
	end

	def get_categories
		if @category
			@category = @category.split(',').collect!{|cat| cat.strip }
		end
		print @category
	end

end