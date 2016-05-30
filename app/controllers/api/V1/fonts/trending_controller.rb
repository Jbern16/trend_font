class Api::v1::Fonts::TrendingController < ApplicationController
  respond_to :json

  def index
    respond_with Font.all("trending_fonts")
  end

end
