# frozen_string_literal: true
FactoryGirl.define do
  factory :post do
    date Time.zone.today
    rationale "Foo"
    user
  end

  factory :second_post, class: "Post" do
    date Time.zone.yesterday
    rationale "Bar"
    user
  end
end
