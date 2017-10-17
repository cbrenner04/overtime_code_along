# frozen_string_literal: true

# mailer for email managers
class ManagerMailer < ApplicationMailer
  def email(manager)
    @manager = manager
    mail(to: @manager.email, subject: "Daily Overtime Request Email")
  end
end
