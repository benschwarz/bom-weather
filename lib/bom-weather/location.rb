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
      
      return @loc
    end
    
    def today
      @outlook.first
    end
    
    private
    def map_forecast(forecast_hash)
      
      # Forecasts come in with min, max and forecast (a description)
      # we want to create groups of each of these, check for nils as a group
      # map the @outlook to these objects
      
      @outlook = []
      (0..7).to_a.each do |i|
        
        # Forecast date work
        year = forecast_hash[:forecast_date].slice(0..3)
        mnth = forecast_hash[:forecast_date].slice(4..5)
        day = forecast_hash[:forecast_date].slice(6..7)
        time = Time.mktime(year,mnth,day) # the first day's time
        forecast_date = (time + (86400*i))
        
        # Map the forecast
        forecast = {
          :forecast_date  => forecast_date, 
          :issue_time     => forecast_hash[:issue_time], 
          :max_temp       => forecast_hash["max_#{i}".to_sym], 
          :min_temp       => forecast_hash["min_#{i}".to_sym],
          :conditions     => forecast_hash["forecast_#{i}".to_sym]
        }
        
        @outlook << Forecast.new(forecast)
      end
    end
  end
end