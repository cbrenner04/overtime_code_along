# frozen_string_literal: true
namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime"
  task sms: :environment do
    # 1. Schedule for Sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip AdminUser
    # 4. Send a message that has instructions and a link to log time
    # users = User.all
    # users.each do |user|
    #   SmsTool.send_sms(number: user.phone, message: 'Please record overtime')
    # end
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
