require_relative "stelling_banjos/version"
require_relative "stelling_banjos/cli"
require_relative "stelling_banjos/scraper"
require_relative "stelling_banjos/banjos"

require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'

module StellingBanjos
  class Error < StandardError; end
  # Your code goes here...
end
