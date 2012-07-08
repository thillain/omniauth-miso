require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Miso < OmniAuth::Strategies::OAuth
      option :name, "miso"
      option :client_options,{:site=>'http://gomiso.com',
                              :authorize_url => 'http://gomiso.com/oauth/authorize',
                              :token_url =>'https://gomiso.com/oauth/access_token'
                             }

     
       #uid { access_token.params[:user_id] }
       uid{ raw_info['user_id'] }
       info do
        { 
          :id => raw_info['id'],
          :nickname => raw_info['nickname'],
          :name => raw_info['name'],
          :username => raw_info['username'],
          :full_name => raw_info['full_name'],
          :profile_image_url => raw_info['profile_image_url'],
          :image => raw_info['image'],
          :description => raw_info['description'],
          :location=>raw_info['location'],
          :urls =>{ 'Website' => raw_info['url']}
          :user_id=raw_info['user_id']
        }
      end
       extra do
        { :raw_info => raw_info }
      end
      
      def raw_info
        @raw_info ||= MultiJson.decode(@access_token.get('/api/oauth/v1/users/show.json').body)['user']
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
      
    end
  end
end
OmniAuth.config.add_camelization 'gomiso', 'Miso'