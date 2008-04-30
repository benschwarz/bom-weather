# Dependencies
require 'rubygems'
require 'validatable'
require 'time'
require 'date'

# Create namespace
module BOMWeather
  VERSION = '0.0.1'
  API_BASE = 'ftp://ftp2.bom.gov.au/anon/gen/fwo/'
end

# Require classes
%w(query base forecast parser location).each{|r| require File.join(File.dirname(__FILE__), File.basename(__FILE__, '.rb'), r)}