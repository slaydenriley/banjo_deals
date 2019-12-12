require_relative "../lib/scraper.rb"
require_relative "../lib/banjos.rb"
require 'pry'
require 'colorize'

class Cli

  #def run
  #  start
  #  first_menu
  #  create_banjos
  #  display_banjos
  #  second_menu
  #  info_page_display
  #  third_menu
  #  exit_out
  #end

  def start
    puts ""
    puts "    ███████╗████████╗███████╗██╗     ██╗     ██╗███╗   ██╗ ██████╗     ██████╗  █████╗ ███╗   ██╗     ██╗ ██████╗ ███████╗".colorize(:green)
    puts "    ██╔════╝╚══██╔══╝██╔════╝██║     ██║     ██║████╗  ██║██╔════╝     ██╔══██╗██╔══██╗████╗  ██║     ██║██╔═══██╗██╔════╝".colorize(:green)
    puts "    ███████╗   ██║   █████╗  ██║     ██║     ██║██╔██╗ ██║██║  ███╗    ██████╔╝███████║██╔██╗ ██║     ██║██║   ██║███████╗".colorize(:green)
    puts "    ╚════██║   ██║   ██╔══╝  ██║     ██║     ██║██║╚██╗██║██║   ██║    ██╔══██╗██╔══██║██║╚██╗██║██   ██║██║   ██║╚════██║".colorize(:green)
    puts "    ███████║   ██║   ███████╗███████╗███████╗██║██║ ╚████║╚██████╔╝    ██████╔╝██║  ██║██║ ╚████║╚█████╔╝╚██████╔╝███████║".colorize(:green)
    puts "    ╚══════╝   ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚════╝  ╚═════╝ ╚══════╝".colorize(:green)
    puts "    ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████".colorize(:green)
    puts ""
    puts "    Hello! Welcome to the Stelling Banjos catelog! The best banjos in the world!"
    first_menu
  end

  def first_menu
    puts ""
    puts "    ══════════════════════════════════"
    puts "    -Type 'Enter' to view the catelog.".colorize(:green)
    puts "    -Type 'Exit' to leave.".colorize(:red)
    puts "    ══════════════════════════════════"
    puts ""

    input = gets.strip.downcase
    case input
    when "enter"
      puts ""
      puts "    Loading...".colorize(:red)
      create_banjos
      display_banjos
    when "exit"
      exit_out
    else
      puts ""
      puts "    Not sure what you mean!".colorize(:red)
      puts ""
      first_menu
    end
  end

  def create_banjos
    Scraper.scrape_catelog_page
    Banjos.create_from_catelog(Scraper.all)
  end

  def display_banjos
    puts ""
    puts "    ██████╗ █████╗ ████████╗███████╗██╗      ██████╗  ██████╗  ".colorize(:green)
    puts "    ██╔════╝██╔══██╗╚══██╔══╝██╔════╝██║     ██╔═══██╗██╔════╝ ".colorize(:green)
    puts "    ██║     ███████║   ██║   █████╗  ██║     ██║   ██║██║  ███╗".colorize(:green)
    puts "    ██║     ██╔══██║   ██║   ██╔══╝  ██║     ██║   ██║██║   ██║".colorize(:green)
    puts "    ╚██████╗██║  ██║   ██║   ███████╗███████╗╚██████╔╝╚██████╔╝".colorize(:green)
    puts "    ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝ ╚═════╝  ╚═════╝  ".colorize(:green)
    puts "    ███████████████████████████████████████████████████████████".colorize(:green)
    puts ""

    Banjos.all.each.with_index do |banjo, index|
      if banjo.sold_out?
        puts "    #{index + 1}. #{banjo.name} - #{banjo.price}" + " - SOLD OUT".colorize(:red)
      else
        puts "    #{index + 1}. #{banjo.name} - #{banjo.price}"
      end
    end
    second_menu
  end

  def second_menu
    puts ""
    puts "    ════════════════════════════════════════════════════════════════════════════".colorize(:green)
    puts "    Please enter the banjo number for more information, or type 'exit' to leave:"
    puts "    ════════════════════════════════════════════════════════════════════════════".colorize(:green)
    puts ""
    input = gets.strip
    if input.downcase == "exit"
      exit_out
    elsif input.to_i.between?(1, Banjos.all.length)
      puts ""
      puts "    Loading...".colorize(:red)
      puts ""
      info_page_display(input)
    else
      puts ""
      puts "    Please make a valid entry".colorize(:red)
      second_menu
    end
  end

  def info_page_display(input)
    description = Scraper.scrape_info_page(Banjos.all[input.to_i - 1].link)
    link = Banjos.all[input.to_i - 1].link
    puts ""
    puts "    ════════════════════════════════════════════════════════════════════════════".colorize(:green)
    puts "    #{Banjos.all[input.to_i - 1].name} - #{Banjos.all[input.to_i - 1].price}".colorize(:green)
    puts ""
    puts "    #{add_newlines("#{description}", 68)}"
    puts ""
    puts "    Interested in buying? Go here:"
    puts "    #{link}".colorize(:blue)
    puts "    ════════════════════════════════════════════════════════════════════════════".colorize(:green)
    third_menu
  end

  def third_menu
    puts ""
    puts "    Type 'Catelog' to view the catelog again:".colorize(:green)
    puts "    Type 'Exit' to exit".colorize(:red)
    puts ""

    input = gets.strip.downcase
    case input
    when "catelog"
      display_banjos
    when "exit"
      exit_out
    else
      puts ""
      puts "    Please make a valid entry...".colorize(:red)
      third_menu
    end
  end

  def add_newlines(string, max_length)
    words = string.split(' ')
    lines = []
    current_line = ''
    until words.empty?
      current_line += " #{words.shift}"
      if current_line.length >= max_length
        lines << current_line
        current_line = ''
      end
    end
    lines.push(current_line).join("\n   ").lstrip
  end

  def exit_out
    puts ""
    puts "    ██████╗  ██████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███████╗██╗ ".colorize(:red)
    puts "    ██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██║".colorize(:red)
    puts "    ██║  ███╗██║   ██║██║   ██║██║  ██║██████╔╝ ╚████╔╝ █████╗  ██║".colorize(:red)
    puts "    ██║   ██║██║   ██║██║   ██║██║  ██║██╔══██╗  ╚██╔╝  ██╔══╝  ╚═╝".colorize(:red)
    puts "    ╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝██████╔╝   ██║   ███████╗██╗".colorize(:red)
    puts "    ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝ ".colorize(:red)
    puts "    ███████████████████████████████████████████████████████████████".colorize(:red)
    puts ""
  end
end
