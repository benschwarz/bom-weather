module BOMWeather
  class Forecast
    attr_accessor :location, :location_id, :timezone, :observed_at, :max_temp, :min_temp, :rain_since_nine_am
        
    include Validatable
    validates_presence_of :location, :location_id, :timezone, :observed_at
    validates_true_for :observed_at, :logic => lambda { observed_at.is_a?(Time) }
    
    def initialize(params)
      @location, @location_id, @timezone, @observed_at = params[:location], params[:location_id], params[:timezone], params[:observed_at]
    end
  end
end