# OmniAuth Miso

This gem contains the Miso strategy for OmniAuth.

Miso uses the OAuth 1.0 flow, you can read about it here: http://gomiso.com/developers/authentication

we are not supporting this gem no longer maintained.

## How To Use It

Usage is as per any other OmniAuth 1.0a strategy.Add the strategy to your Rails 'Gemfile':

    gem 'omniauth-miso'

You can pull them in directly from github e.g.:

    gem 'omniauth-miso', :git => 'https://github.com/judearasu/omniauth-miso.git'

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :miso, "consumer_key", "consumer_secret" 
    end

Now just follow the README at: https://github.com/intridea/omniauth

## Supported Rubies

OmniAuth Miso is tested under 1.8.7, 1.9.2, 1.9.3,ree and JRuby.

[![CI Build
Status](https://secure.travis-ci.org/judearasu/omniauth-miso.png)](http://travis-ci.org/judearasu/omniauth-miso)


## License

Copyright (c) 2012 by Jude Arasu

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
