# frozen_string_literal: true
# no doc
class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@cjb-overtime.herokuapp.com"
  layout "mailer"
end
