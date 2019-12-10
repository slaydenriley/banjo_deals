class Banjos
  attr_accessor :name, :price, :description

  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end

  def start
    puts "Hello, welcome to the banjo deals catelog!"
    puts "Type 'Enter' to view the catelog. Type 'Exit' to leave."

    if gets.strip.downcase == "enter"
      self.catelog
    elsif gets.strip.downcase == "exit"
      exit
    end
  end
end
