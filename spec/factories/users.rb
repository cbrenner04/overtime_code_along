# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    first_name "Foo"
    last_name "Bar"
    sequence(:email) { |n| "user#{n}@example.com" }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    phone "5555555555"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "Baz"
    sequence(:email) { |n| "admin_user#{n}@example.com" }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    phone "5555555555"
  end

  factory :other_user, class: "Employee" do
    first_name "Not"
    last_name "Authorized"
    sequence(:email) { |n| "user#{n}@example.com" }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    phone "5555555555"
  end
end
