class TrendingFontsController < ApplicationController
  before_action :required_fonts, only: [:index]

  def index
    @trending_fonts = Font.all(params['controller'])
  end

end
