class StellingBanjos::Banjos
  attr_accessor :name, :price, :link, :sold_out

  @@all = []

  def initialize(name, price, link, sold_out)
    @name = name
    @price = price
    @link = link
    @sold_out = sold_out
    @@all << self
  end

  def self.create_from_catelog(array)
    array.each do |hash|
      self.new(hash[:name], hash[:price], hash[:link], hash[:sold_out])
    end
  end

  def sold_out?
    case @sold_out
    when "Yes"
      return true
    when "No"
      return false
    else
      return false
    end
  end

  def self.all
    @@all
  end
end
