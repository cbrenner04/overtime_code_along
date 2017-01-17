# frozen_string_literal: true
FactoryGirl.define do
  factory :audit_log do
    user
    status 0
    start_date Time.zone.today - 6.days
    date_verified nil
  end
end
