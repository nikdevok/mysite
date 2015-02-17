require 'rails_helper'

describe 'Main page', type: :feature do
  before :each do
    create(:main_page)
    @admin = create(:admin)
    sign_in(@admin)
  end

  scenario "Edit main page" do
      visit main_url
      click_on "Редактировать"
      fill_in "static_page[body]", with: "new body"
      click_on "Сохранить"
      expect(StaticPage.find_by_page_type("main").body).to eq("new body")
  end

end

