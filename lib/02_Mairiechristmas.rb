require 'nokogiri'
require 'open-uri'
 
# 対象のURL
url = "http://annuaire-des-mairies.com/"
 
# NokogiriでURLの情報を取得する
rootpage = Nokogiri::HTML(URI.open(url),nil,"utf-8")

# Get Symbol
arr_region = [] 
rootpage.xpath('//td/a').each do |link|
    #arr_symbol.push(link.content)
    arr_region.push(link['href'])
    puts arr_region
end

page = Nokogiri::HTML(URI.open(url),nil,"utf-8")

# Get Price
arr_price = [] 
page.xpath('//a[contains(@class, "cmc-link")]/span').each do |link|
    arr_price.push(link.content)
end

# Make Hash
#resule_hash = Hash[arr_symbol.zip arr_price.map]
#puts resule_hash
