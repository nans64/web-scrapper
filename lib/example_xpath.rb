# Example for scrapping
=begin
	require 'open-uri'
	require 'nokogiri'

	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"))


	doc.css('html').each do |node|
		l = doc.xpath('/html/body/div[3]/div/div/div/section[2]/div/div/div/article/div[4]/section/dl/dd[1]/a').map { |link| link['href'].delete_prefix("mailto:") }
		puts l
	end

# Example for parser
	require 'open-uri'
	require 'nokogiri'

	doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))


	doc.css('div.contenu_page').each do |node|
#		name_depute = doc.css('span.list_nom').text.split(','),
		url = doc.css('td/a').map { |link| "https://www.nosdeputes.fr" + link['href'] }
		puts url
#		puts url
	end
=end

	require 'open-uri'
	require 'nokogiri'
	url_test = ["https://www.nosdeputes.fr/gael-le-bohec"]
	reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

	doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/michel-zumkeller"))

	jobs = Array.new # Create the Array

	url_test.each do |link|
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