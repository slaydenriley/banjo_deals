require 'pry'
class Banjos
  attr_accessor :name, :price, :link, :description

  @@all = []

  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end

  def self.create_from_catelog(banjo_array)
    banjo_array.each do |hash|
      Banjos.new(hash)
    end
  end

  def self.all
    @@all
  end
end
