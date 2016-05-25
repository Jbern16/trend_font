require 'rails_helper'

RSpec.feature 'user can see fonts' do
  scenario 'when they visit /popular' do
    VCR.use_cassette('feature/see_fonts', record: :new_episodes)  do

      font1 = Font.all("popular_fonts").first

      visit '/popular'

      expect(page).to have_content font1.family
      expect(page).to have_content font1.subsets
      expect(page).to have_link "Download", href: font1.file

    end
  end
end
