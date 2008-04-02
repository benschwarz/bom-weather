require File.join(File.dirname(__FILE__), 'spec_helper')

module ForecastHelper
  def valid_forecast_attributes
    {
      :location => 'Melbourne',
      :location_id => '86071',
      :timezone => 'EDT',
      :observed_at => Time.parse("20080402T0900")
    }
  end
end


describe BOMWeather::Forecast, "validation" do
  include ForecastHelper
  
  it "should be valid" do
    BOMWeather::Forecast.new(valid_forecast_attributes).should be_valid
  end
  
  it "should require location, location_id, timezone and observed_at" do
    %w(location location_id timezone observed_at).each do |attr|
      BOMWeather::Forecast.new(valid_forecast_attributes.without(attr.to_sym)).should_not be_valid
    end
  end
  
  it "observed_at must be a Time class instance" do
    BOMWeather::Forecast.new(valid_forecast_attributes.without(:observed_at).merge({:observed_at => '20080402T0900'})).should_not be_valid
    BOMWeather::Forecast.new(valid_forecast_attributes).should be_valid
  end
end

describe BOMWeather::Forecast, "class attributes" do
  include ForecastHelper
  
  before do
    @forecast = BOMWeather::Forecast.new(valid_forecast_attributes)
  end
  
  it "should have a give the time of when the forecast was taken" do
    @forecast.should respond_to :observed_at
    @forecast.observed_at.should(be_an_instance_of(Time))
  end
  
  it "should consist of timezone, location, location_id, max_temp, min_temp and rain_since_nine_am" do
    %w(timezone location location_id max_temp min_temp rain_since_nine_am).each do |attr|
      @forecast.should respond_to attr.to_sym
    end
  end
end

describe BOMWeather::Forecast, "class methods" do
  it "should give a forecast for a location_id"
end