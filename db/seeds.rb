@user = User.create!(email: "foo@example.com",
                     password: "secrets!",
                     password_confirmation: "secrets!",
                     first_name: "John",
                     last_name: "Smith",
                     phone: "2164691035")

puts "1 User created"

User.create!(email: "admin@example.com",
             password: "secrets!",
             password_confirmation: "secrets!",
             first_name: "Admin",
             last_name: "Smith",
             type: "AdminUser",
             phone: "2164691035")

puts "1 Admin created"

100.times do |post|
  Post.create!(date: Date.today,
               rationale: "Lorem ipsum dolor sit amet, consectetur adipisicin" \
                          "gelit. Ex mollitia quam esse iusto nostrum, dolor " \
                          "nam libero tempora quos excepturi architecto alias" \
                          " facilis sit voluptatum sapiente odit quod. Quidem" \
                          ", ea.",
               user_id: @user.id,
               overtime_request: 2.5)
end

puts "100 posts have been created"

100.times do |post|
  AuditLog.create!(user: @user,
                   status: 0,
                   start_date: Time.zone.today - 6.days)
end

puts "100 audit logs have been created"
