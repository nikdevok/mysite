FactoryGirl.define do
  factory :main_page, class: StaticPage do
    page_type "main"
    title "Главная"
    menu_title "Главная"
    body "<h1>Добро пожаловать</h1>"
  end

  factory :about_me_page, class: StaticPage do
    page_type "about_me"
    title "Обо мне"
    menu_title "Обо мне"
    body "<h1>Обо мне</h1>"
  end

  factory :schedules_page, class: StaticPage do
    page_type "schedules"
    title "Расписание"
    menu_title "Расписание"
    body "<h1>Расписание занятий</h1>"
  end
end