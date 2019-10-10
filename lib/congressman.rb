require 'nokogiri'
require 'open-uri'


#________________________________NAME_________________________________________________________________

	array1 = []

	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	page.xpath('//*[@id="deputes-list"]//div//ul//li/a').each do |name|
	name.text
	array1 << name.text
	end

#puts array1.length


#_________________________CONGRESSMAN LINK________________________________________________________________________


	url = []
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	page.xpath('//*[@id="deputes-list"]//div//ul//li/a').each do |link|
	url << link
	puts link["href"]
	end

#_________________________EMAIL FOR ONE CONGRESSMAN________________________________________________________________________



	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"))
	page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |email|
	#puts email.text
	end


