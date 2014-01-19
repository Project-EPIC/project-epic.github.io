class Person

	@@profile_photo_path = "./assets/auto_generated/profile_pics"

	attr_accessor :name, :status
	def initialize(name, status)
		@name = name
		@status = status
		puts "Name: #{@name}"
	end

	def validate
		
		if @gscholar_link
			print "Scraping Google Scholar..."
			scrape_google_scholar(@gscholar_link)
			print "done\n"
		end
		
	end

	def scrape_google_scholar(url)
		require 'nokogiri'
		require 'open-uri'
		doc_html = Nokogiri::HTML(open(url))

		#Get photo URL: 
		photo_url = doc_html.xpath(
			"//div[contains(@class,'g-unit')]//div[contains(@class,'cit-user-info')]//img/@src")[0].to_s

		if photo_url =~ /^\//i
			photo_url.insert(0,'http://scholar.google.com')
		end

		open(photo_url) {|f|
   			File.open("#{@@profile_photo_path}/#{@name.gsub(/\s+/,'_')}.jpg","wb") do |pic|
    			pic.puts f.read
   			end
		}

		profile_pic = "#{@@profile_photo_path}/#{@name.gsub(/\s+/,'_')}.jpg"[1..-1]

		affiliation = doc_html.xpath(
			"//div[contains(@class,'g-unit')]//span[contains(@id,'cit-affiliation-display')]/text()")[0].to_s

		interests_html = doc_html.xpath(
			"//div[contains(@class,'g-unit')]//span[contains(@id,'cit-int-read')]//a/text()")
		
		interests = []
		interests_html.each do |interest|
			interests << interest.to_s
		end

		url = doc_html.xpath(
			"//div[contains(@class,'g-unit')]//span[contains(@id,'cit-homepage-read')]//a/@href")[0].to_s

		
		local_variables.each do |var|
			unless var.to_s =~ /(_html$|_url$)/i
				unless eval(var.to_s).empty?
					instance_variable_set("@#{var}", eval(var.to_s))
				end
			end
		end



	end






end