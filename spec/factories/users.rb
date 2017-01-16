# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    first_name "Foo"
    last_name "Bar"
    sequence(:email) { |n| "user#{n}@example.com" }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "Baz"
    sequence(:email) { |n| "admin_user#{n}@example.com" }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :other_user, class: "User" do
    first_name "Not"
    last_name "Authorized"
    sequence(:email) { |n| "user#{n}@example.com" }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end
