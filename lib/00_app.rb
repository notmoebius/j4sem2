# Projet validant : Dark Trader

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
   

def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   # je charge la page dans nokogiri
  crypto_listings = page.xpath('//table//tbody/tr') # je filtre en prenant uniquement de tableau des monnaies
  crypto_names = Array.new
  count_crypto = 0   # compteur du tableau bitcoin
  crypto_listings.each do |bitcoin|  # Pour chaque item du listing, j'extrait le nom et 
    crypto_name = {
      name: bitcoin.xpath('//*[@class="text-left col-symbol"]')[count_crypto].text,  
      price: bitcoin.xpath('//*[@class="price"]')[count_crypto].text 
    }
    count_crypto +=1
    crypto_names << crypto_name # je mets mon hash crypto/prix dans mon tableau
  end

  return crypto_names # un tableau de hash avec symbol: price
end

puts crypto_scrapper

