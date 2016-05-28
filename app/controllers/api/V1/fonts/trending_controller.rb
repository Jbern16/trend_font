class Api::V1::Fonts::TrendingController < ApiController
  respond_to :json

  def index
    fonts = Font.all("trending_fonts")
    respond_with :api, :V1, fonts
  end

end
