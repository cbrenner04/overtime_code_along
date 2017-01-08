# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    first_name "Foo"
    last_name "Bar"
    email "foo@example.com"
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "Baz"
    email "baz@example.com"
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end
