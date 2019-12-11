require_relative "../lib/scraper.rb"
require_relative "../lib/banjos.rb"
require 'pry'
require 'colorize'

class Cli

  def run
    start
  end

  def start
    Scraper.scrape_catelog_page
    puts "Hello, welcome to the banjo deals catelog!"
    puts "Type 'Enter' to view the catelog."
    puts "Type 'Exit' to leave."

    if gets.strip.downcase == "enter"
      create_banjos
      display_banjos
    elsif gets.strip.downcase == "exit"
      self.exit
    else
      puts "Not sure what you mean!"
    end
  end

  def create_banjos
    Banjos.create_from_catelog(Scraper.all)
  end

  def display_banjos
    Banjos.all.each.with_index do |banjo, index|
      if banjo.sold_out?
        puts "#{index + 1}. #{banjo.name} - #{banjo.price}" + " - SOLD OUT".colorize(:red)
      else
        puts "#{index + 1}. #{banjo.name} - #{banjo.price}"
      end
    end
    puts ""
    puts "Please enter the banjo number for more information, or type 'exit' to leave:"

    input = gets.strip
    if input == "exit".downcase
      self.exit
    else
      puts "#{Banjos.all[input.to_i - 1].name}".colorize(:red)
      puts "#{Banjos.all[input.to_i - 1].description}"
    end
    puts "Enter another banjo number: or"
    puts "Type 'catelog' to view the catelog again: or"
    puts "Type 'exit' to exit"
    gets.strip
  end
end
