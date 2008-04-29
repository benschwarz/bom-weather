Gem::Specification.new do |s|
  s.name = "bom-weather"
  s.version = "0.0.1"
  s.date = "2008-04-29"
  s.summary = "Weather from the Australian Bureau of Meteorology"
  s.email = "ben.schwarz@gmail.com"
  s.homepage = "http://github.com/benschwarz/bom-weather"
  s.description = "Weather from the Australian Bureau of Meteorology"
  s.has_rdoc = false
  s.authors = ["Ben Schwarz"]
  s.files = ["Rakefile", "README", "lib/bom-weather.rb", "lib/bom-weather/base.rb", "lib/bom-weather/forecast.rb", "lib/bom-weather/location.rb", "lib/bom-weather/parser.rb", "lib/bom-weather/query.rb"]
  s.add_dependency("validatable", [">= 1.6.7"])
end