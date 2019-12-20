class StellingBanjos::Scraper

  @@all = []

  def self.scrape_catalog_page(link)
    catalog = Nokogiri::HTML(open(link))
    catalog.css("div.ProductItem").each do |banjo|
      name = banjo.css("h2").text.strip
      if banjo.css("span").text.strip.include?("Sold out")
        sold_out = "Yes"

        #This removes "Sold out" from the end of each price
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
    info.css("div.ProductMeta__Description.Rte").text.strip.split("More").shift.to_s.strip
      #This was the only way I found to remove the "More Details..." at the end of each description
  end

  def self.all
    @@all
  end
end
