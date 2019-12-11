require 'pry'
require_relative '../lib/scraper.rb'

class Banjos
  attr_accessor :name, :price, :link, :description

  @@all = []

  def initialize(name, price, link, description = nil)
    @name = name
    @price = price
    @link = link
    @description = description
    @@all << self
  end

  def self.create_from_catelog
    Scraper.all.each do |hash|
      Banjos.new(hash)
    end
    binding.pry
  end

  def self.all
    @@all
  end
end
