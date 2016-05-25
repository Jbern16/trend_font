require 'rails_helper'

RSpec.describe Font do
  it 'has its methods for trending' do
    VCR.use_cassette('font/has_methods_trending') do
      fonts = Font.all("trending_fonts")
      font = fonts.first

      expect(font).to respond_to :family
      expect(font).to respond_to :file
      expect(font).to respond_to :subsets
      expect(font).to respond_to :cdn
    end
  end

  it 'has its methods for popular' do
    VCR.use_cassette('font/has_methods_popular') do

      fonts = Font.all("popular_fonts")
      font = fonts.first

      expect(font).to respond_to :family
      expect(font).to respond_to :file
      expect(font).to respond_to :subsets
      expect(font).to respond_to :cdn
    end
  end

end
