@user = User.create!(email: "foo@example.com", password: "secrets!", password_confirmation: "secrets!", first_name: "John", last_name: "Smith")

puts "1 User created"

User.create!(email: "admin@example.com", password: "secrets!", password_confirmation: "secrets!", first_name: "Admin", last_name: "Smith", type: "AdminUser")

puts "1 Admin created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 posts have been created"
