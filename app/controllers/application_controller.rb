require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  helper_method :current_user
  protect_from_forgery with: :null_session
  respond_to :html, :json

  def current_user
    @user ||=  OpenStruct.new(session[:user]) if session[:user]
  end

  def required_fonts
    @required_families = Font.all(params["controller"]).map do |font|
      font.family
    end.map(&:to_s).join(", ")
  end

end
