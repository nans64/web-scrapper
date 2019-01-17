require 'open-uri'
require 'nokogiri'
require 'byebug'

def get_townhall_email(townhall_url)
	 

	reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

	doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/michel-zumkeller"))

	jobs = Array.new # Create the Array

	$url.each do |link|
	doc = Nokogiri::HTML(open(link)) # Open the page

	doc.xpath('//*[@id="b1"]').each do |node| # Loop to collect informations
		
			job = {
				email: doc.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li/a').map { |link| link['href'].delete_prefix("mailto:") },
				nom: doc.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1').text.split(' ')[1,2],
				prenom: doc.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1').text.split(' ')[0]


# .map { |link| link['href'].delete_prefix("mailto:") }
			}
			jobs << job
#s			puts "Scrap de #{job[email]} en cours" # Print email
				
			puts jobs
			end

	  end

end	


def get_townhall_urls

		doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))

#		name_depute = doc.css('span.list_nom').text.split(','),
#		url = doc.css('td/a').map { |link| "https://www.nosdeputes.fr" + link['href'] }
#		puts name_depute
#		puts url



	doc.css('div.contenu_page').each do |node|
#		name_depute = doc.css('span.list_nom').text.split(','),
		$url = doc.css('td/a').map { |link| "https://www.nosdeputes.fr" + link['href'] }
#		puts url
	end

	get_townhall_email($lien)

end
get_townhall_urls 