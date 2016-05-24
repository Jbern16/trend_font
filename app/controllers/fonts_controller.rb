class FontsController < ApplicationController

  def index
    @trending_fonts = Font.all
  end

end
