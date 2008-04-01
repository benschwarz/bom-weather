require 'spec_helper'

describe BOMWeather::Query, "class" do
  before :all do
    @query = BOMWeather::Query.new("http://bom.org.au/")
  end
  
  it "should create an instance of its self" do
    @query.should(be_an_instance_of(BOMWeather::Query))
  end
  
  it "should respond to uri" do
    @query.should(respond_to(:uri))
  end
  
  it "should query a url and return a hpricot document" do
    @query.execute.should(be_an_instance_of(Hpricot::Doc))
  end
end