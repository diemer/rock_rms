require 'sinatra/base'
require 'securerandom'

class RockMock < Sinatra::Base
  post '/api/Auth/Login' do
    content_type :json

    response['Cache-Control'] = 'no-cache'
    response['Content-Secuity-Policy'] = "frame-ancestors 'self'"
    response['Date'] = Time.now.httpdate
    response['Expires'] = '-1'
    response['Pragma'] = 'no-cache'
    response['Set-Cookie'] = [
      ".ROCK=#{SecureRandom.hex(100)}",
      "expires=#{(Time.now + 14).httpdate}",
      'path=/',
      'HttpOnly'
    ].join('; ')
    response['X-Frame-Options'] = 'SAMEORIGIN'

    status 204
  end
end