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
   describe '#info' do
    before :each do
      @raw_info = {
          :id => '362474',
          :nickname => '',
          :name => '',
          :username => 'judearasu',
          :full_name => 'Jude Arasu',
          :profile_image_url => 'http://gomiso.com/uploads/BAhbCFsHOgZmIiEyMDEyLzA3LzA3LzA1LzQxLzI5Lzc0OC9maWxlWwc6BmU6CHBuZ1sIOgZwOgp0aHVtYiILODB4ODAj.png',
          :image => '',
          :description => '',
          :location=>'',
          :urls =>{ 'Website' => 'http://judearasu.github.com'},
          :provider =>'miso'
      }
      subject.stub(:raw_info) { @raw_info }
    end
    context 'when data is present in raw info' do
       it 'returns the name' do
        subject.info[:name].should be_nil
      end
    end
   end
end
