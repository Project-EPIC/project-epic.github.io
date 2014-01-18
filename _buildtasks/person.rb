class Person
	attr_accessor :name, :status
	def initialize(name, status)
		@name = name
		@status = status
		puts "Name: #{@name}"
	end

	


	def validate
		
		if @gscholar_link
			puts "Scraping Google Scholar Now:"
			scrape_google_scholar(@gscholar_link)
		end
		
	end
end

def scrape_google_scholar(url)
	require 'nokogiri'
	require 'open-uri'
	doc = Nokogiri::HTML(open(url))

	#Need to learn how to parse this information with xpath to get 
	#interests and images - perhaps write images to a local directory as well...
	puts doc.xpath('.//img/@src').map {|a| a.value }

end