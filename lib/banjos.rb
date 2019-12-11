require 'pry'
require_relative '../lib/scraper.rb'

class Banjos
  attr_accessor :name, :price, :link, :description, :sold_out

  @@all = []

  def initialize(name, price, link, description = nil, sold_out = nil)
    @name = name
    @price = price
    @link = link
    @description = description
    @sold_out = sold_out
    @@all << self
  end

  def self.create_from_catelog(array)
    array.each do |hash|
      Banjos.new(hash[:name], hash[:price], hash[:link], hash[:description], hash[:sold_out])
    end
  end

  def sold_out?
    if @sold_out == "Yes"
      return true
    elsif @sold_out == "No"
      return false
    else
      return false
    end
  end

  def self.all
    @@all
  end
end
