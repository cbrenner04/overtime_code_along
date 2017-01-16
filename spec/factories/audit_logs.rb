# frozen_string_literal: true
FactoryGirl.define do
  factory :audit_log do
    user
    status 1
    start_date "2017-01-16"
    date_verified "2017-01-16"
  end
end
