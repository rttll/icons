#!/usr/bin/env ruby
require "thor"

module Icons
  class Search < Thor
    desc "search", "Starts the search site"
    def search
      puts "To search, open http:localhost:4567"
      cmd = "ruby search/app.rb"
      value = `#{cmd}`
    end
  end
end

Icons::Search.start