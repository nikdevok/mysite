require 'rails_helper'

describe 'News', type: :feature do
  before :each do
    @admin = create(:admin)
    sign_in(@admin)
  end

  scenario "Add correct news" do
      visit news_index_path
      click_on "Добавить"
      fill_in "Заголовок", with: "News"
      fill_in "news[body]", with: "news body"
      click_on "Создать"
      expect(News.last.body).to eq("news body")
      expect(page).to have_content("news body")
  end

  scenario "Add incorrect news" do
      visit news_index_path
      click_on "Добавить"
      click_on "Создать"
      expect(page).to have_content("Заголовок")
      expect(page).to have_content("Текст")
  end

  scenario "Edit news" do
      @news = create(:news)
      visit edit_news_path(@news)
      fill_in "Заголовок", with: "New header"
      click_on "Сохранить"
      expect(page).to have_content("New header")
  end

  scenario "Delete news" do
      @news = create(:news)
      visit news_index_path
      click_on "Удалить"
      visit news_index_path
      expect(page).not_to have_content("news body")
      expect(News.count).to eq(0)
  end

end

