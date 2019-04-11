# Projet validant : CongressMan

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_congres_email(congress_URL)
    page = Nokogiri::HTML(open(congress_URL))
    congress_ident = {}
    congress_name = page.xpath('//html//body//div[3]//div//div//div//section[1]//div//article//div[2]/h1').text
    email = page.xpath('//html//body//div[3]//div//div//div//section[1]//div//article//div[3]//div//dl//dd[4]//ul//li[2]/a').text
    tab_name = congress_name.split(' ')

    congress_ident = {              # on crée le hash pour le/la député-e
        first_name: tab_name[1],
        last_name: tab_name[2],
        email: email
    }
    return congress_ident
end

def get_congress_urls
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
    congress_names = page.xpath('//tr/td[1]/a/@href')

    ary_result = [] # init arrray

    congress_names.each do |congress|

        url_congress = "http://www2.assemblee-nationale.fr#{congress}"
        #ary_result << url_congress
        #puts get_congres_email(url_congress)
        ary_result.push(get_congres_email(url_congress))
    end
    return ary_result
end

# main
puts get_congress_urls