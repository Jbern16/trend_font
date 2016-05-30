require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  helper_method :current_user
  protect_from_forgery with: :null_session
  respond_to :html, :json
  before_action :add_allow_credentials_headers

 def add_allow_credentials_headers
   response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || 'http://jbernesser.me/trendwolf/*'
   response.headers['Access-Control-Allow-Credentials'] = 'true'
 end

 def options
   head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
 end

  def current_user
    @user ||=  OpenStruct.new(session[:user]) if session[:user]
  end

  def required_fonts
    @required_families = Font.all(params["controller"]).map do |font|
      font.family
    end.map(&:to_s).join(", ")
  end

end
