require 'open-uri'
require 'nokogiri'
require 'byebug'

def get_deputy_emails(urls)
	 

	reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

	jobs = Array.new # Create the Array

	$url.each do |link|
	doc = Nokogiri::HTML(open(link)) # Open the page

	doc.xpath('//*[@id="b1"]').each do |node| # Loop to collect informations
		
			job = {
				
				email: doc.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li/a').map { |link| link['href'].delete_prefix("mailto:") },
				last_name: doc.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1').text.split(' ')[1,2],
				first_name: doc.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1').text.split(' ')[0]

			}
			jobs << job
				
			puts jobs
			return jobs
			end
	  
	  end
byebug
end	


def get_deputy_urls

	doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))

	doc.css('div.contenu_page').each do |node|
		$url = doc.css('td/a').map { |link| "https://www.nosdeputes.fr" + link['href'] }
	end

	get_deputy_emails($url)

end 
puts get_deputy_urls.is_a?Array
puts get_deputy_urls.include?('Abad')
puts get_deputy_urls.length==1
