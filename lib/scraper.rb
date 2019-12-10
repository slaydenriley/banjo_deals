require 'open-uri'
require 'pry'

class Scraper
  def self.scrape_catelog_page
    catelog = Nokogiri::HTML(open(https://www.elderly.com/collections/stelling))
  end

  def self.scrape_info_page(info_url)
    info = Nokogiri::HTML(open(info_url))
  end

end
