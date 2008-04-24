require File.join(File.dirname(__FILE__), 'spec_helper')

describe BOMWeather::Location do
  it "should respond to location_id" do
    BOMWeather::Location.public_instance_methods.should(include('location_id'))
  end
  
  it "should respond to name" do
    BOMWeather::Location.public_instance_methods.should(include('name'))
  end
  
  it "should respond to state" do
    BOMWeather::Location.public_instance_methods.should(include('state'))
  end
  
  it "should respond to find" do
    BOMWeather::Location.find(:location => "Arm").should(be_an_instance_of(Array))
    BOMWeather::Location.find(:location => "Arm").first.should(be_an_instance_of(BOMWeather::Location))
  end
  
  #it "should find case-insensitive matches" do
    #BOMWeather::Location.find(:state => "VIC").should(eql(BOMWeather::Location.find(:state => "Vic")))
  #end
  
  it "should have a current forecast" do
    BOMWeather::Location.find(:location => "Arm").first.today.should(be_an_instance_of(BOMWeather::Forecast))
    BOMWeather::Location.find(:location => "Arm").first.outlook.should(be_an_instance_of(BOMWeather::Forecast))
    
    puts BOMWeather::Location.find(:location => "Arm").first.today.inspect
  end
  
  it "should have a forecast outlook"
end