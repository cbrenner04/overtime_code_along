# frozen_string_literal: true
namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime"
  task sms: :environment do
    include Rails.application.routes.url_helpers
    if Time.zone.now.tuesday?
      employees = Employee.all
      notification_message = "Please log into overtime management dashboard " \
                             "to request overtime or confirm your hours for " \
                             "last week: https://cjb-overtime.herokuapp.com"
      employees.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: notification_message)
      end
    end
  end

  desc "Sends email to managers daily for pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.any?
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end
