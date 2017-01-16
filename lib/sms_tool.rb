# frozen_string_literal: true
# sms logic
module SmsTool
  def self.send_sms(number:, message:)
    p "Sending SMS..."
    p "#{message} to #{number}"
  end
end
