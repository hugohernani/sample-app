User.create!(name:  (ENV["MY_USER_DEFAULT_NAME"] || 'Example User'),
             email: (ENV["MY_USER_DEFAULT_EMAIL"] || 'example@gmail.com'),
             password:              (ENV["MY_USER_DEFAULT_PASSWORD"] || 'password'),
             password_confirmation: (ENV["MY_USER_DEFAULT_PASSWORD"] || 'password'),
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = (ENV["DEFAULT_USER_PASSWORD:"] || 'password')
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each do |user|
    user.microposts.create!(content: content)
  end
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
