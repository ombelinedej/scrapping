require 'nokogiri'
require 'open-uri'


#___________CRYPTO PRICE ______________________________________________________________________________________


array1 = []


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


page.xpath('//a[@class="price"]').each do |price|
#puts price.text
array1 << price.text
end


#___________CRYPTO NAME ______________________________________________________________________________________

array2 = []


page.xpath('//a[@class="currency-name-container link-secondary"]').each do |crypto_name|
#puts crypto_name.text
array2 << crypto_name.text
end

#___________HASH ______________________________________________________________________________________


result = Hash.new


puts Hash[*array2.zip(array1).flatten]


