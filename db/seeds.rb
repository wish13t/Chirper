
users = User.order(created_at: :desc)
10.times do
  title = Faker::String.random
  content = Faker::String.random(length: 300..1200)
  users.each { |user| user.blogs.create!(title: title, content: content) }
end