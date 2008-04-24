module BOMWeather
  class Query
    attr_accessor :uri
  
    def initialize(uri="ftp://ftp2.bom.gov.au/anon/gen/fwo/IDA00001.dat")
      @uri = uri
    end
    
    def execute
      Parser.new(open(@uri).read)
    end
  end
end