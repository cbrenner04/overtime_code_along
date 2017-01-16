# frozen_string_literal: true
FactoryGirl.define do
  factory :post do
    date Time.zone.today
    rationale "Foo"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Time.zone.yesterday
    rationale "Bar"
    overtime_request 0.5
    user
  end
end
