# Dependencies
require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'validatable'
require 'time'

# Create namespace
module BOMWeather
  VERSION = '0.0.1'
  API_BASE = 'ftp://ftp2.bom.gov.au/anon/gen/fwo/'
end

# Require classes
%w(query base forecast measurement).each{|r| require File.join(File.dirname(__FILE__), File.basename(__FILE__, '.rb'), r)}