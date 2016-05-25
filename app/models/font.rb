class Font < OpenStruct

  def self.service
    GoogleFontService.new
  end

  def self.all
    raw_fonts = service.trending_fonts
    raw_fonts.first(10).map do |font|
      Font.new(family: font[:family], file: font[:files][:regular],
               subsets: font[:subsets].join(', '), cdn: get_cdn_link(font))
    end
  end

  def self.get_cdn_link(font)
    family = font[:family]
    if family.include?(" ")
      "https://fonts.googleapis.com/css?family=#{family.split.join("+")}"
    else
      "https://fonts.googleapis.com/css?family=#{family}"
    end
  end

  def idify
    family.split.join("-")
  end

end
