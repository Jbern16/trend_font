class PopularFontsController < ApplicationController
  before_action :required_fonts, only: [:index]

    def index
      @popular_fonts = Font.all(params['controller'])
    end

end
