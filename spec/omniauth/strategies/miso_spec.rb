require 'spec_helper'
require 'omniauth-miso'
require 'base64'

describe OmniAuth::Strategies::Miso do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
    @request.stub(:cookies) { {} }

    @client_id = '123'
    @client_secret = '53cr3tz'
    @options = {:client_options => {:site => 'https://gomiso.com/',:authorize_url=>'/oauth/authorize'}}
  end

  subject do
    args = [@client_id, @client_secret, @options].compact
    OmniAuth::Strategies::Miso.new(nil, *args).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end
  context "client options" do

    it 'has correct miso name' do
      subject.options.name.should eq('miso')
    end

    it 'has correct site name' do
      subject.options.client_options.site.should eq('https://gomiso.com/')
    end
    
    it 'has correct authorize url' do
      subject.options.client_options[:authorize_url].should eq('/oauth/authorize')
    end
  end
end
