require 'rails_helper'

RSpec.feature 'user can see fonts' do
  scenario 'when they visit /recent' do
    VCR.use_cassette('feature/see_recent_fonts')  do

      font1 = Font.all("recent_fonts").first

      visit '/recent'

      expect(page).to have_content font1.family
      expect(page).to have_content font1.subsets
      expect(page).to have_link "Download", href: font1.file

    end
  end
end
