# frozen_string_literal: true
namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime"
  task sms: :environment do
    # Schedule for Sunday at 5pm
    # Iterate over all employees
    # Skip AdminUser
    # Send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms(number: )
    # end
  end
end
