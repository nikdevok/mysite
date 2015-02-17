
StaticPage.create(page_type: "main", title: "Главная", menu_title: "Главная", body: "<h1>Добро пожаловать на сайт!</h1>")
StaticPage.create(page_type: "about_me", title: "Обо мне", menu_title: "Обо мне", body: "<h1>Здесь будет информация обо мне!</h1>")
StaticPage.create(page_type: "schedules", title: "Расписание занятий", menu_title: "Расписание занятий", body: "<h1>Здесь будет расписание!</h1>")


if User.where(:nickname => "Nicolanice").size == 0
  u = User.create(
          :email => "nicolanice8362@gmail.com",
          :nickname => "Nicolanice",
          :login => "nicolanice",
          :password => "nicolanice",
          :password_confirmation => "nicolanice"
        )
  u.roles = ["admin"]

  puts u.save ? "admin Nicolanice created" : "admin Nicolanice failed"
end

if User.where(:nickname => "Kristinka").size == 0
  u = User.create(
      :email => "kristinka-cherry@mail.ru",
      :nickname => "Kristinka",
      :login => "kristinka",
      :password => "kristinka",
      :password_confirmation => "kristinka"
  )
  u.roles = ["admin"]
  puts u.save ? "admin Kristinka created" : "admin Kristinka failed"
end