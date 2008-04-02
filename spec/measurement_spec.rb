require File.join(File.dirname(__FILE__), 'spec_helper')

module MeasurementHelper
  def valid_measurement_attributes
    {
      :name => 'maximum temperature',
      :value => 23.1,
      :unit => 'celsius',
      :unit_abbreviation => '&#176;C',
      :type_code => 'tx'
    }
  end
end

describe BOMWeather::Measurement, "class" do
  include MeasurementHelper
  
  before do
    @measure = BOMWeather::Measurement.new(valid_measurement_attributes)
  end
  
  it "should have a name" do
    @measure.should respond_to :name
  end
  
  it "should have a value" do
    @measure.should respond_to :value
  end
  
  it "should have a unit" do
    @measure.should respond_to :unit
  end
  
  it "should have a unit_abbreviation" do
    @measure.should respond_to :unit_abbreviation
  end
  
  it "should have a type_code" do
    @measure.should respond_to :type_code
  end
end


describe BOMWeather::Measurement, "validation" do
  include MeasurementHelper

  it "should be valid" do
    BOMWeather::Measurement.new(valid_measurement_attributes).should be_valid
  end
  
  it "must have a name, value, unit, unit_abbreviation and type_code to be valid" do
    %w(name value unit unit_abbreviation type_code).each do |attr|
      BOMWeather::Measurement.new(valid_measurement_attributes.without(attr.to_sym)).should_not be_valid
    end
  end
end