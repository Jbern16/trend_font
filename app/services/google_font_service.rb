class GoogleFontService

  def initialize
    @connection = Faraday.new(url: "https://www.googleapis.com")
  end

  def get_fonts(sort_param)
    @connection.get do |req|
      req.url '/webfonts/v1/webfonts'
      req.params['key'] = ENV['GOOGLE_FONT_KEY']
      req.params['sort'] = sort_param
    end
  end

  def trending_fonts
    parse(get_fonts('trending'))
  end

  def popular_fonts
    parse(get_fonts('popularity'))
  end

  def recent_fonts
    parse(get_fonts('date'))
  end

  private

  def parse(response)
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed[:items]
  end

end
