require 'rails_helper'

describe 'Users management' do
  before :each do
    @user = create(:admin)
    sign_in(@user)
  end

  scenario "Add new correct user" do
    visit admin_users_path
    click_on "Добавить"
    fill_in "Логин", with: "user"
    fill_in "Ник на сайте", with: "user"
    fill_in "Email", with: "user@mail.ru"
    fill_in "user_password", with: "11111111"
    fill_in "user_password_confirmation", with: "11111111"
    click_on "Сохранить"
    expect(User.last.login).to eq("user")
  end

  scenario "Add new incorrect user" do
    visit admin_users_path
    click_on "Добавить"
    click_on "Сохранить"
    expect(page).to have_content("Логин")
    expect(page).to have_content("Пароль")
    expect(page).to have_content("Ник на сайте")
  end

  scenario "Edit user" do
    visit admin_users_path
    click_on "Изменить"
    fill_in "Логин", with: "super_admin"
    fill_in "user_password", with: "11111111"
    fill_in "user_password_confirmation", with: "11111111"
    click_on "Сохранить"
    expect(User.find_by_login("super_admin")).to_not be_nil
  end

  scenario "Delete user" do
    create(:user)
    visit admin_users_path
    click_on "Удалить"
    expect(User.find_by_login("user")).to be_nil
  end

  # begin "Helpers" do
  # end
end