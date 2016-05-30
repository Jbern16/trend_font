class Font < OpenStruct

  def self.service
    GoogleFontService.new
  end

  def self.all(method)
    raw_fonts = service.send(method)
    ranking = 0
    raw_fonts.first(10).map do |font|
      Font.new(family: font[:family], file: font[:files][:regular],
               subsets: font[:subsets].join(', '), cdn: get_cdn_link(font),
               ranking: (ranking += 1).to_s )
    end
  end

  def self.get_cdn_link(font)
    family = font[:family]
    "https://fonts.googleapis.com/css?family=#{family.split.join("+")}"
  end

  def idify
    family.split.join("-")
  end

  def find_rank(fonts)
    fonts.index(self) + 1
  end
end
