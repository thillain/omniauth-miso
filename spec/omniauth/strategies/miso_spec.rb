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
  context '#info' do
    before :each do
      subject.stub(:raw_info) { 
        {
          'id' => '123',
          'description' => '',
          'full_name' => 'Jude Arasu',
          'image' => '',
          'location' => '',
          'name' => '',
          'nickname' => '',
          'profile_image_url' => 'http://gomiso.com/uploads/BAhbCFsHOgZmIiEyMDEyLzA3LzA3LzA1LzQxLzI5Lzc0OC9maWxlWwc6BmU6CHBuZ1sIOgZwOgp0aHVtYiILODB4ODAj.png',
          'urls' => {'Website'=> 'http://judearasu.github.com'},
          'username' => 'judearasu',

        }
      }
    end

    it 'returns the id from raw_info' do
      subject.info[:id].should eq('123')
    end
    it 'returns the description from raw_info' do
      subject.info[:description].should eq('')
    end
    it 'returns the full name from raw_info' do
      subject.info[:full_name].should eq('Jude Arasu')
    end
    it 'returns the image from raw_info' do
      subject.info[:image].should eq('')
    end
    it 'returns the location from raw_info' do
      subject.info[:location].should eq('')
    end
    it 'returns the name from raw_info' do
      subject.info[:name].should eq('')
    end
    it 'returns the nickname from raw_info' do
      subject.info[:nickname].should eq('')
    end
    it 'returns the profile image url from raw_info' do
      subject.info[:profile_image_url].should eq('http://gomiso.com/uploads/BAhbCFsHOgZmIiEyMDEyLzA3LzA3LzA1LzQxLzI5Lzc0OC9maWxlWwc6BmU6CHBuZ1sIOgZwOgp0aHVtYiILODB4ODAj.png')
    end
    it 'returns the website from raw_info' do
      subject.info[:urls].should be_a(Hash)
       subject.info[:urls][:Website].should eq('http://judearasu.github.com')
     end
    it 'returns the username from raw_info' do
      subject.info[:username].should eq('judearasu')
    end
    
  end
end
