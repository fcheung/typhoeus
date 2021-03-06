require File.dirname(__FILE__) + '/../spec_helper'

describe Typhoeus::HeaderWrapper do
  before(:each) do
    @headers = Typhoeus::HeaderWrapper.new
  end
  
  it "should be case insensitive" do
    @headers['content-length'] = '123456'
    @headers['Content-length'].should == '123456'
    @headers['ConTENt-leNGth'].should == '123456'
  end
  
  it "should concatenate repeated headers" do
    @headers['Set-Cookie'] = 'cookie1'
    @headers['Set-Cookie'] = 'cookie2'
    @headers['Set-Cookie'] = 'cookie3'
    @headers['Set-Cookie'].should == 'cookie1, cookie2, cookie3'
  end
  
  it "should allow iteration" do
    @headers['Header1'] = 'value1'
    @headers['HeaDER2'] = 'value2'
    @headers['Header3'] = 'value3'

    result = {}
    @headers.each {|k,v| result[k]=v}
    result.should == {'Header1' => 'value1', 'Header2' => 'value2', 'Header3' => 'value3'}
  end

  it "should canonicalize header names" do
    @headers['content-length'] = 'value1'
    result = {}
    @headers.each {|k,v| result[k]=v}
    result.should == {'Content-Length'=> 'value1'}
  end
end