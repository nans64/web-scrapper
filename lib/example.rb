require 'rubygems'
require 'nokogiri'
require 'restclient'
PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"


page = Nokogiri::HTML(RestClient.get("http://ruby.bastardsbook.com/files/hello-webpage.html"))   
links = page.css("a")
news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }

puts news_links.class   #=>   Array         

puts page.css("title")[0].name   # => title
puts page.css("title")[0].text   # => My webpage
puts links[0]["href"] # => http://www.google.com

