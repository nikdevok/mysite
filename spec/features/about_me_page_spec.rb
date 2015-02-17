require 'rails_helper'

describe 'About me page', type: :feature do
  before :each do
    create(:about_me_page)
    @admin = create(:admin)
    sign_in(@admin)
  end

  scenario "Edit about me page" do
      visit about_url
      click_on "Редактировать"
      fill_in "static_page[body]", with: "new body"
      click_on "Сохранить"
      expect(StaticPage.find_by_page_type("about_me").body).to eq("new body")
  end

end

