require_relative "../lib/scraper.rb"
require_relative "../lib/banjos.rb"
require 'pry'
require 'colorize'

class Cli

  def start
    Scraper.scrape_catelog_page
    puts "Hello, welcome to the banjo deals catelog!"
    puts "Type 'Enter' to view the catelog. Type 'Exit' to leave."

    if gets.strip.downcase == "enter"
      self.catelog
    elsif gets.strip.downcase == "exit"
      exit
    else
      puts "Not sure what you mean!"
    end
  end

  def catelog
    puts "Enter banjo number for more detailed description:"
    puts "1. Stelling Staghorn With Old Wood Rim and Case - $6,250"
    puts "2. Stelling Master Flower (1995) -$3,600"
    puts "...etc."
  end
end
