module BOMWeather
  class Parser
    attr_reader :headers, :rows
    
    def initialize(input_stream)
      @data = input_stream.split("\n")
      parse_headers
      parse_rows
    end
    
    private
    
    def parse_headers
      # Get the first line as headers, split apart and create symbols
      @headers = @data.shift.split("#").map{ |h| h.to_sym }
    end
    
    def parse_rows
      @rows = @data.map do |row|
        fields  = row.split('#')
        hash    = {}
        
        @headers.each_with_index do |header, index|
          hash[header] = fields[index]
        end
        
        hash
      end
    end
  end
end