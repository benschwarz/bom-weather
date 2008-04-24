require File.join(File.dirname(__FILE__), 'spec_helper')

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
  
  it "should query a url and return a parser object" do
    @query.execute.should(be_an_instance_of(BOMWeather::Parser))
  end
  
  it "should default to the full location list if no address is supplied" do
    q = BOMWeather::Query.new 
    q.uri.should(eql("ftp://ftp2.bom.gov.au/anon/gen/fwo/IDA00001.dat"))
  end
end