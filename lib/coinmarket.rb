require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
	url = "https://coinmarketcap.com/"
	unparsed_page = HTTParty.get(url)
	parsed_page = Nokogiri::HTML(unparsed_page)
	jobs = Array.new
	job_listings = parsed_page.css('div.listingCard') #50 jobs
	object_counting = 1
	per_page = job_listings.count #50 

	while object_counting <= job_listings.count
		pagination_url = "https://coinmarketcap.com/"
		puts pagination_url
		puts "Page: #{page}"
		puts ''
		pagination_unparsed_page = HTTParty.get(pagination_url)
		pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
		pagination_job_listings = pagination_parsed_page.css('id-bitcoin.odd')

		puts pagination_job_listings
		pagination_job_listings.each do |job_listing|
			job = {
				title: job_listing.css('no-wrap currency-name').text,
				# company: job_listing.css('span.company').text,
				# location: job_listing.css('span.location').text,
				# url: "https://coinmarketcap.com/"# + job_listing.css('a')[0].attributes["href"].value
			}
			jobs << job
			puts "Added #{job[:title]}"
			puts ""
		end
		object_counting += 1
	end
    
end

scraper