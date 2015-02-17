require 'rails_helper'

describe 'Schedules page', type: :feature do
  before :each do
    create(:schedules_page)
    @admin = create(:admin)
    sign_in(@admin)
  end

  scenario "Edit schedules page" do
      visit schedules_url
      click_on "Редактировать"
      fill_in "static_page[body]", with: "new body"
      click_on "Сохранить"
      expect(StaticPage.find_by_page_type("schedules").body).to eq("new body")
  end

end

