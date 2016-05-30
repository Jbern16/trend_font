class Api::V1::Fonts::RecentController < ApplicationController
  respond_to :json

  def index
    fonts = Font.all("recent_fonts")
    respond_with :api, :V1, fonts
  end

end
