#coding:utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if StaticPage.count == 0
  StaticPage.create(page_type: "Главная страница", body: "<h1>Добро пожаловать на сайт!</h1>")
  StaticPage.create(page_type: "Обо мне", body: "<h1>Здесь будет информация обо мне!</h1>")
  StaticPage.create(page_type: "Расписание занятий", body: "<h1>Здесь будет расписание!</h1>")
end


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