require 'open-uri'
require 'nokogiri'
require 'byebug'

def get_townhall_email(townhall_url)
	 
	jobs = Array.new # Create the Array

	$lien.each do |link|
	doc = Nokogiri::HTML(open(link)) # Open the page

	doc.xpath('/html').each do |node| # Loop to collect informations
			job = {
				 email = node.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text => # Xpath for email
	  			 city = node.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text # Xpath for city
			}
			jobs << job
			puts "Scrap de #{job[email]} en cours" # Print email
				
				
			end

	  end
   	return jobs
   	puts "J'ai fini de scrapper les #{$amount_links} liens"	#185

end	


def get_townhall_urls

	doc2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		doc2.css('html').each do |node|
		$lien = doc2.css('a.lientxt').map { |link| "http://annuaire-des-mairies.com" + link['href'].delete_prefix(".") } # Reformat the URL

		puts "j'ai fini de récupérer les liens"
		$amount_links = $lien.count # Count the number of link

		end 

#	puts "Voici les lien #{$lien}"
	get_townhall_email($lien)

end
 