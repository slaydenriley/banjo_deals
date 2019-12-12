require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  @@all = []
  LINK = "https://www.elderly.com/collections/stelling"

  def self.scrape_catelog_page
    catelog = Nokogiri::HTML(open(LINK))
    catelog.css("div.ProductItem").each do |banjo|
      name = banjo.css("h2").text.strip
      if banjo.css("span").text.strip.include?("Sold out")
        sold_out = "Yes"
        price = "$" + banjo.css("span").text.strip.split("$").pop.to_s
      else
        sold_out = "No"
        price = banjo.css("span").text.strip
      end
      link = "https://www.elderly.com" + banjo.css("a").map{|link| link['href']}[0]
      @@all << {name: name, price: price, link: link, sold_out: sold_out}
    end
  end

  def self.scrape_info_page(link)
    info = Nokogiri::HTML(open(link))
    info.css("div.ProductMeta__Description.Rte").text.strip
  end

  def self.all
    @@all
  end
end
