require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-miso'

ENV['CLIENT_ID']='L342xgomRJ4oTCL7D9cQ'
ENV['CLIENT_SECRET']='xMTTX0vZ25C6FGOmLOn53je9OQaBC8P21iplqqOH'



use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :miso, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end

class App < Sinatra::Base
  get '/' do
    <<-HTML
 <ul>
 <li><a href='/auth/miso'>Sign in with Miso</a></li>
 </ul>
 HTML
  end

  get '/auth/miso/callback' do
       puts "THE RESULT HASH: #{request.env['omniauth.auth']}"
  end

  get '/auth/failure' do
    content_type 'text/plain'
    request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  end

  
end


run App.new

