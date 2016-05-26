class RecentFontsController < ApplicationController
  before_action :required_fonts, only: [:index]

  def index
    @recent_fonts = Font.all(params["controller"])
  end

end
