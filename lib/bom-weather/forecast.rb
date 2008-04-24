module BOMWeather
  class Forecast
    attr_accessor :forecast_date, :issue_time, :max_temp, :min_temp
        
    include Validatable
    validates_presence_of :forecast_date, :issue_time, :max_temp, :min_temp
    
    validates_true_for :forecast_date,  :logic => lambda { forecast_date.is_a?(Time) }
    validates_true_for :issue_time,     :logic => lambda { issue_time.is_a?(Time) }
    
    def initialize(params)
      @forecast_date, @issue_time, @max_temp, @min_temp = params[:forecast_date], params[:issue_time], params[:max_temp], params[:min_temp]
    end
  end
end