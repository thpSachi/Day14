require 'nokogiri'
require 'open-uri'
 
# 対象のURL
root_url = "http://annuaire-des-mairies.com/"
 
# NokogiriでURLの情報を取得する
root_page = Nokogiri::HTML(URI.open(root_url),nil,"utf-8")

arr_region_page = [] 
arr_ville_page = [] 

# Get Link from Root page
root_page.xpath('//td/a/@href').each do |root_link|
    arr_region_page.push(root_link.content)
end

# Get Link from Region page
arr_region_page.each do |i|
    region_url = root_url + i

    begin 
        region_page = Nokogiri::HTML(URI.open(region_url),nil,"utf-8")
        region_page.xpath('//tbody/tr/td/a/@href').each do |region_link|
            arr_ville_page.push(region_link.content)
        end
    rescue => e
        puts "rescue."
    end

end

# Get Email Adress from Village page
arr_ville_page.each do |j|
    ville_url = root_url + j

    begin 
        ville_page = Nokogiri::HTML(URI.open(ville_url),nil,"utf-8")
        ville_page.xpath('//tbody/tr/td[text("@mairie")]').each do |adress|
            puts adress
        end
    rescue => e
        puts "Error.  Push [Ctrl + C]"
    end
end 

