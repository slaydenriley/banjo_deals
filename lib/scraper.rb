require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  def self.scrape_catelog_page
    catelog = Nokogiri::HTML(open("https://www.elderly.com/collections/stelling"))
    banjos = []
    catelog.css("div.ProductItem h2").each do |banjo|
      name = banjo.text.strip
      binding.pry
    end
  end

  def self.scrape_info_page(info_url)
    info = Nokogiri::HTML(open(info_url))
  end

end
