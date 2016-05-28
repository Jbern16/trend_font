class Api::V1::Fonts::PopularController < ApiController
  respond_to :json

  def index
    fonts = Font.all("popular_fonts")
    respond_with :api, :V1, fonts
  end

end
