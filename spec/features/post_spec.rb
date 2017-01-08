# frozen_string_literal: true
require "rails_helper"

describe "posts" do
  before do
    @user = User.create!(
      email: "foo@example.com",
      password: "asdfasdf",
      password_confirmation: "asdfasdf",
      first_name: "foo",
      last_name: "bar"
    )
    login_as(@user, scope: :user)
  end

  describe "index" do
    before { visit posts_path }
    it "can be reached successfully" do
      expect(status_code).to eq 200
    end

    it "has a title of Posts" do
      expect(page).to have_text "Posts"
    end

    it "has a list of posts" do
      post1 = Post.create!(date: Date.today, rationale: "foo", user: @user)
      post2 = Post.create!(date: Date.today, rationale: "bar", user: @user)
      visit posts_path
      expect(page).to have_text post1.rationale
      expect(page).to have_text post2.rationale
    end
  end

  describe "creation" do
    before do
      visit new_post_path
    end

    it "has a new form that can be reached" do
      expect(status_code).to eq 200
    end

    it "can be created from new form page" do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "foo"
      click_on "Save"

      expect(page).to have_text "foo"
    end

    it "will have a user associated with it" do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "bar"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq "bar"
    end
  end
end
