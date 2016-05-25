class TrendingFontsController < ApplicationController
  before_action :required_fonts, only: [:index]

  def index
    @trending_fonts = Font.all("trending_fonts")
  end

end
