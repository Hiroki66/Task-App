# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
              
99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

for user_id in 1..3 do
  50.times do |n|
    content = "タスク-#{n+1}"
    detail = "サンプル-#{n+1}"
    user_id = user_id
    Task.create!(content: content,
               detail: detail,
               user_id: user_id)
  end
end