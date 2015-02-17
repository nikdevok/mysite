require 'rails_helper'

describe 'Static pages', type: :feature do
  before :each do
    create(:main_page)
    create(:about_me_page)
    create(:schedules_page)
    @admin = create(:admin)
    sign_in(@admin)
  end

  scenario "menu links" do
    visit root_path
  end

  scenario "main page" do
      visit root_path
      expect(page).to have_content("Добро пожаловать")
  end

  scenario "about me page" do
      visit about_url
      expect(page).to have_content("Обо мне")
  end

  scenario "schedules page" do
      visit schedules_url
      expect(page).to have_content("Расписание")
  end

end

