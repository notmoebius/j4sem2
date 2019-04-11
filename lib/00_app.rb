# Projet validant : Dark Trader

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
   

def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   # je charge la page dans nokogiri
  crypto_listings = page.css('.bottom-margin-1x > div:nth-child(3)') # je filtre en prenant uniquement de tableau des monnaies
  
  crypto_listings.each do | bitcoin |  # Pour chaque item du listing, j'extrait le nom et 
    # crypto_names {
    #   name: page.css('#id-birds > td:nth-child(3)').text}
    #    price: page.css('#id-birds > td:nth-child(5)').text
    # }
    print bitcoin.css('td:nth-child(3)').text
    puts bitcoin.css('td:nth-child(5)').text
    #binding.pry
  end
  binding.pry
  return # un tableau de hash avec symbol: price
end

# css symbol: #id-birds > td:nth-child(3)
# css price: #id-birds > td:nth-child(5)
# xpath symbol: /html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[2093]/td[3]
# xpath price :
crypto_scrapper