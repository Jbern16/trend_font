class Api::V1::Fonts::TrendingController < ApiController
  respond_to :json

  def index
    respond_with Font.all("trending_fonts")
  end

end
