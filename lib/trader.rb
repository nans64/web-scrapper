	require 'open-uri'
	require 'nokogiri'
	require 'byebug'

def crypto_scrapper

	url = "https://coinmarketcap.com/all/views/all/"
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	crypto_list = Array.new
	object_counting = 1

	while object_counting < 2

			doc.xpath('//tr').each do |job_listing|
				
			scrapping = {
				 symbol = job_listing.css('td.col-symbol').text =>
				 value = job_listing.css('a.price').text
			}
			crypto_list << scrapping
			puts "Added #{scrapping[symbol]}"
			puts "Added #{scrapping[value]}"
			puts ""	
				
		end

		object_counting += 1
	end
   	return crypto_list 
end