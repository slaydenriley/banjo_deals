require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  @@all = []

  def self.scrape_catelog_page
    html = "https://www.elderly.com/collections/stelling"
    catelog = Nokogiri::HTML(open(html))
    catelog.css("div.ProductItem").each do |banjo|
      name = banjo.css("h2").text.strip
      price = banjo.css("span").text.strip
      link = html + banjo.css("a").map{|link| link['href']}[0]
      @@all << {name: name, price: price, link: link}
    end
  end

  def self.scrape_info_page(link)
    info = Nokogiri::HTML(open(link))
  end

  def self.all
    @@all
  end

end
