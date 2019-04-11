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
      name: bitcoin.xpath('//*[@class="text-left col-symbol"]')[count_crypto].text,  # #id-bitcoin > td:nth-child(3)
      price: bitcoin.xpath('//*[@class="price"]')[count_crypto].text # #id-bitcoin > td:nth-child(5) > a:nth-child(1)
    }
    # puts bitcoin.xpath('//*[@class="text-left col-symbol"]')[count_crypto].text #xpath bitcoin.xpath('//*[@class="text-left col-symbol"]').text
    # puts bitcoin.xpath('//*[@class="price"]')[count_crypto].text #xpath bitcoin.xpath('//*[@class="price"]').text 
    count_crypto +=1
    crypto_names << crypto_name # je mets mon hash crypto/prix dans mon tableau
  end

  return crypto_name # un tableau de hash avec symbol: price
end

crypto_scrapper

