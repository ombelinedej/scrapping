require 'nokogiri'
require 'open-uri'



#______________CITIES NAME___________________________________________________________________________________


def get_townhall_name
	
	name = []

	page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
	page.xpath('//a[@class="lientxt"]').each do |city|
	puts city.text
	name << city.text

	end
	return name
end


#___________EMAIL FOR ONE CITY ______________________________________________________________________________________


#def get_one_email
	#page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
	#page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
#puts email.text
	#end
#end

#________________CITIES URL _________________________________________________________________________________

def get_townhall_url
	array_url = []

	page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
		page.xpath('//a[@class="lientxt"]').each do |link|
			url = link["href"]
		#recomposition de l'url
			final_url =  "https://www.annuaire-des-mairies.com" + url[1..-1]
			array_url << final_url
		
			#puts final_url
	end
	return array_url

end


#___________CITIES EMAILS______________________________________________________________________________________


def get_email(get_townhall_url)
	email_array = []
	
	get_townhall_url.each do |url|
		page = Nokogiri::HTML(open(url))
			page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
			email_array << email.text
		end
	end

	return email_array
	#puts email_array

end


begin #pour faire les exeptions pour que ça marche


url = get_townhall_url
email = get_email(url)
name = get_townhall_name

#___________HASH CREATION______________________________________________________________________________________

final_list = Hash.new
final_list = Hash[*name.zip(email).flatten]

rescue => e #pour faire les exeptions pour que ça marche


puts "Tout va bien pas de panique". #pour faire les exeptions pour que ça marche


end

#_________________________________________________________________________________________________


puts final_list



