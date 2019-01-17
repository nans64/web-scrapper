require 'open-uri'
require 'nokogiri'
require 'byebug'

	array = ["http://annuaire-des-mairies.com/95/ableiges.html", "http://annuaire-des-mairies.com/95/noisy-sur-oise.html"]

	reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	jobs = Array.new # Create the Array

	array.each do |link|
	doc = Nokogiri::HTML(open(link))

	doc.xpath('/html').each do |node|
			job = {
				 email = node.text.scan(reg).uniq.join('') =>
	  			 city = node.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text
			}
			jobs << job
			puts "Added #{email}"
			puts "Added #{job[city]}"	
				
				
			end

	  end
   	puts jobs