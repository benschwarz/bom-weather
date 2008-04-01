module BOMWeather
  class Query
    attr_accessor :uri
  
    def initialize(uri)
      @uri = uri
    end
    
    def execute
      Hpricot(open(@uri).read)
    end
  end
end