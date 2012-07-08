require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Miso < OmniAuth::Strategies::OAuth
      option :name, "miso"
      option :client_options,{:site=>'https://gomiso.com/',
                              :authorize_url => '/oauth/authorize',
                             }

     
       uid { access_token.params[:user_id] }
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