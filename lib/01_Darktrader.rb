require 'nokogiri'
require 'open-uri'
 
# 対象のURL
url = "https://coinmarketcap.com/all/views/all/"
 
# NokogiriでURLの情報を取得する
#　注意　openの前に「」を付けないとエラーになる！
page = Nokogiri::HTML(URI.open(url),nil,"utf-8")


#puts "### xpathノードを検索する"
page.xpath('//nav//ul//li/a', '//article//h2').each do |link|
#  puts link.content
end

page.xpath('//div').each do |link|
#   puts link.content
end

page.xpath('//div').each do |link|
 #   puts link.content
 end




page.xpath('//a[@class="cmc-table__column-name--symbol"]').each do |link|
    #   puts link.content
    end

    page.xpath('//div').each do |link|
          puts link.content
          p link.css('a').attribute('class')
        end

  page.xpath('//li[2]').each do |link|
  #  puts link.content
  end

  page.xpath('//p/text()').each do |link|
  #  puts link.content
  end
