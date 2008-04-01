# Dependencies
require 'rubygems'
require 'hpricot'
require 'open-uri'

# Create namespace
module BOMWeather
  VERSION = '0.0.1'
end

# Require classes
%w(query forecast).each{|r| File.join(File.dirname(__FILE__), File.basename(__FILE__, '.rb'), r)}