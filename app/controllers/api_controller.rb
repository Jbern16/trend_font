class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  self.responder = ApplicationResponder
  respond_to :html, :json
  before_action :add_allow_credentials_headers

 def add_allow_credentials_headers
   response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || 'http://jbernesser.me/trendwolf/*'
   response.headers['Access-Control-Allow-Credentials'] = 'true'
 end

 def options
   head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
 end


end
