class Font < OpenStruct

  def self.service
    GoogleFontService.new
  end

  def self.all
    raw_fonts = service.trending_fonts
    raw_fonts.first(10).map do |font|
      Font.new(family: font[:family], file: font[:files][:regular],
               subsets: font[:subsets].join(', '))
    end
  end

end
