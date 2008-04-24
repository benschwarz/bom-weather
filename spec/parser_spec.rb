require File.join(File.dirname(__FILE__), 'spec_helper')

describe BOMWeather::Parser, "class" do
  before :all do
    dat_file = File.read(File.join(File.dirname(__FILE__), 'sample_files', 'IDA00001.dat'))
    @parser = BOMWeather::Parser.new(dat_file)
  end
  
  it "should receive a string" do
    @parser.should be_an_instance_of BOMWeather::Parser
  end
  
  it "should list the headers" do
    @parser.headers.should(be_an_instance_of(Array))
    @parser.headers.first.should(be_an_instance_of(Symbol))
    @parser.headers.first.should(eql(:loc_id))
  end
  
  it "should list rows" do
    @parser.rows.should(be_an_instance_of(Array))
    
    @parser.rows.first.should(be_an_instance_of(Hash))
    @parser.rows.first[:loc_id].should(eql("056037"))
  end
  
  it "should set row column names as symbols" do
    @parser.rows.first.keys.first.should(be_an_instance_of(Symbol))
  end
end