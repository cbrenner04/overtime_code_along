# frozen_string_literal: true
require "rails_helper"

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      user = User.create!(
        email: "foo@example.com",
        password: "asdfasdf",
        password_confirmation: "asdfasdf",
        first_name: "foo",
        last_name: "bar"
      )
      @post = Post.create!(date: Time.zone.today, rationale: "foo", user: user)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date and rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
