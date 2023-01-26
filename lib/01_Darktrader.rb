require 'nokogiri'
require 'open-uri'
 
# 対象のURL
url = "https://coinmarketcap.com/all/views/all/"
 
# NokogiriでURLの情報を取得する
page = Nokogiri::HTML(URI.open(url),nil,"utf-8")

# Get Symbol
arr_symbol = [] 
page.xpath('//a[contains(@class, "cmc-table__column-name--symbol")]').each do |link|
    arr_symbol.push(link.content)
end

# Get Price
arr_price = [] 
page.xpath('//a[contains(@class, "cmc-link")]/span').each do |link|
    arr_price.push(link.content)
end

# Make Hash
resule_hash = Hash[arr_symbol.zip arr_price.map]
puts resule_hash
