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
    more_info_display
    input = gets.strip
  end

  def more_info_display
    Banjos.all.each do |banjo|
      Scraper.scrape_info_page(banjo.link)
    end
  end
end
