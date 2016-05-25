require 'rails_helper'

RSpec.feature 'user can login with google' do
  scenario "they click on log in with google" do

    OmniAuth.config.test_mode = true

    OmniAuth.config.add_mock(
      :google_oauth2,
      {
        :info => {
        :email => 'test@some_test_domain.com',
        :name=>'Test User'
      }
    })

    visit "/"
    expect(page.status_code).to eq 200
    click_link "Log In With Google"
    expect(current_path). to eq "/"
    expect(page).to have_content "Test User"
    expect(page).to have_link "Logout"

  end
  scenario 'they can logout' do

    OmniAuth.config.test_mode = true

    OmniAuth.config.add_mock(
      :google_oauth2,
      {
        :info => {
        :email => 'test@some_test_domain.com',
        :name=>'Test User'
      }
    })

    visit "/"

    click_link "Log In With Google"

    click_link 'Logout'

    expect(page).to have_content "Log In With Google"

  end

end
