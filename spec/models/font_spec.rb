require 'rails_helper'

RSpec.describe Font do
  it 'has its methods' do
    VCR.use_cassette('font/has_methods') do
      fonts = Font.all
      font = fonts.first

      expect(font).to respond_to :family
      expect(font).to respond_to :file
      expect(font).to respond_to :subsets
      expect(font).to respond_to :cdn
    end
  end
end
