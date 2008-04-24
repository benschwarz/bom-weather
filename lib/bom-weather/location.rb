module BOMWeather
  class Location
    attr_reader :location_id, :name, :state, :outlook
    
    def initialize(location={})
      @location_id, @name, @state = location[:loc_id], location[:location], location[:state]
      map_forecast(location)
    end
    
    # Single key finder only
    def self.find(finder={})
      locations = Query.new.execute.rows.find_all{|row| row[finder.keys.first] =~ /#{finder[finder.keys.first]}/i}
      @loc = locations.uniq.map do |location|
        Location.new(location)
      end
      
      puts @loc.inspect
      
    end
    
    def today
      @outlook
    end
    
    private
    def map_forecast(forecast_hash)
#      puts forecast_hash.inspect
      @outlook = Forecast.new(forecast_hash)
    end
  end
end