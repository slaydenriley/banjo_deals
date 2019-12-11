require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  def self.scrape_catelog_page
    html = "https://www.elderly.com/collections/stelling"
    catelog = Nokogiri::HTML(open(html))
    banjos = []
    catelog.css("div.ProductItem").each do |banjo|
      name = banjo.css("h2").text.strip
      price = banjo.css("span").text.strip
      link = html + banjo.css("a").map{|link| link['href']}[0]
      binding.pry
    end
  end

  def self.scrape_info_page(info_url)
    info = Nokogiri::HTML(open(info_url))
  end

end
