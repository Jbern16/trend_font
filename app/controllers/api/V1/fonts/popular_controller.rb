class Api::V1::Fonts::PopularController < ApplicationController
  respond_to :json

  def index
    respond_with Font.all("popular_fonts")
  end

end
