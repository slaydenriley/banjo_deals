require 'pry'
require_relative '../lib/scraper.rb'

class Banjos
  attr_accessor :name, :price, :link, :description

  @@all = []

  def initialize(name, price, link)
    @name = name
    @price = price
    @link = link
    @description = description
    @@all << self
  end

  def self.create_from_catelog(array)
    array.each do |hash|
      Banjos.new(hash[:name], hash[:price], hash[:link])
    end
  end

  def sold_out?
  end

  def self.all
    @@all
  end
end
