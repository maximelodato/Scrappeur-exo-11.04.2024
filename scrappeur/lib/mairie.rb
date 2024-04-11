require 'nokogiri'
require 'open-uri'

def scrape_crypto_data
  doc = Nokogiri::HTML5(URI.open("https://coinmarketcap.com/all/views/all/"))
  
  crypto_page = doc.xpath('//tr[contains(@class, "cmc-table-row")]')

  crypto_hash = {}

  crypto_page.each do |row|
    name = row.xpath('.//td[2]').text
    currency = row.xpath('.//td[5]').text
    crypto_hash[name] = currency
  end

  crypto_hash
end
puts scrape_crypto_data