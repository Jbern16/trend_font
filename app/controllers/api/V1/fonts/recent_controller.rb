class API::V1::Fonts::RecentController < ApplicationController
  respond_to :json

  def index
    respond_with Font.all("recent_fonts")
  end

end
