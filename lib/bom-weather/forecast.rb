module BOMWeather
  class Forecast
    attr_accessor :forecast_date, :issue_time, :max_temp, :min_temp, :conditions
        
    include Validatable
    validates_presence_of :forecast_date, :issue_time, :max_temp, :min_temp, :conditions
    
    validates_true_for :forecast_date, :logic => lambda { forecast_date.is_a?(Time) }
    validates_true_for :issue_time,     :logic => lambda { issue_time.is_a?(Time) }
    
    def initialize(params)
      @issue_time =       params[:issue_time]
      @conditions =       params[:conditions]
      
      @max_temp, @min_temp = params[:max_temp], params[:min_temp]
      
      @forecast_date =    params[:forecast_date]
    end
  end
end