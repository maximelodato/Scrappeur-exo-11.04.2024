require 'nokogiri'
require 'open-uri'

def scrape_email_data
  doc = Nokogiri::HTML(URI.open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50"))
  
  email_page = doc.xpath("/html/body/div/main/div/div/div")

  email_hash = {}

  email_page.each do |row|
    name = row.xpath(".//h2[@class='titre_normal']").text
    # Ajoutez une pause de 5 secondes entre chaque requête
    sleep(5)
    email = row.xpath(".//a[contains(@class,'ann_mail')]").text
    email_hash[name] = email
  end

  email_hash
end

puts scrape_email_data
