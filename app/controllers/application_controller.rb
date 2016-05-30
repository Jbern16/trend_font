require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @user ||=  OpenStruct.new(session[:user]) if session[:user]
  end

  def required_fonts
    @required_families = Font.all(params["controller"]).map do |font|
      font.family
    end.map(&:to_s).join(", ")
  end

end
