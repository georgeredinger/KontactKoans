require 'pry'
dir = File.expand_path(__FILE__)
path=dir.split("/")[0..-3].join("/")

Dir["#{path}/**/*_test.rb"].each do |file|
  require file
end

