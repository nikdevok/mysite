FactoryGirl.define do
  factory :admin, class: User do
    login "admin"
    password "11111111"
    nickname "admin"
    roles ["admin"]
  end

  factory :user, class: User do
    login "admin"
    password "11111111"
    nickname "admin"
    roles ["user"]
  end
end