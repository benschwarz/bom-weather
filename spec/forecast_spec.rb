require File.join(File.dirname(__FILE__), 'spec_helper')

module ForecastHelper
  def valid_forecast_attributes
    {
      :forecast_date => Time.parse("20080402T0900"),
      :issue_time => Time.parse("20080402T0900"),
      :max_temp => "24",
      :min_temp => "3",
      :conditions => "Cloudy, patchy rain"
    }
  end
end


describe BOMWeather::Forecast, "validation" do
  include ForecastHelper
  
  it "should be valid" do
    BOMWeather::Forecast.new(valid_forecast_attributes).should be_valid
  end
  
  it "should require forecast_date, issue_time, max_temp and min_temp" do
    %w(forecast_date issue_time max_temp min_temp conditions).each do |attr|
      BOMWeather::Forecast.new(valid_forecast_attributes.without(attr.to_sym)).should_not be_valid
    end
  end
  
  it "forecast_date and issue_time must be a Time class instance" do
    BOMWeather::Forecast.new(valid_forecast_attributes.without(:forecast_date).merge({:forecast_date => '20080402T0900'})).should_not be_valid
    BOMWeather::Forecast.new(valid_forecast_attributes).should be_valid
    
    BOMWeather::Forecast.new(valid_forecast_attributes.without(:issue_time).merge({:issue_time => '20080402T0900'})).should_not be_valid
    BOMWeather::Forecast.new(valid_forecast_attributes).should be_valid
  end
  
  it "should have a condition description"
end

describe BOMWeather::Forecast, "class attributes" do
  include ForecastHelper
  
  before do
    @forecast = BOMWeather::Forecast.new(valid_forecast_attributes)
  end
  
  it "should have a give the time of when the forecast was taken" do
    @forecast.should respond_to :issue_time
    @forecast.issue_time.should(be_an_instance_of(Time))
  end
  
  it "should consist of forecast_date, issue_time, max_temp, min_temp" do
    %w(forecast_date issue_time max_temp min_temp conditions).each do |attr|
      @forecast.should respond_to attr.to_sym
    end
  end
end