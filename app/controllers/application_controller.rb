class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :required_fonts

  def current_user
    @user ||= session[:user] if session[:user]
  end


  def required_fonts
    @required_families = Font.all.map do |font|
      font.family
    end
     @required_families = @required_families.map(&:to_s).join(", ")
  end

end
