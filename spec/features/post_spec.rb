# frozen_string_literal: true
require "rails_helper"

describe "posts" do
  let(:user) { create :user }
  let(:post) { create :post, user: user }

  before { login_as(user, scope: :user) }

  describe "index" do
    before { visit posts_path }

    it "can be reached successfully" do
      expect(status_code).to eq 200
    end

    it "has a title of Posts" do
      expect(page).to have_text "Posts"
    end

    it "has a list of posts" do
      post
      visit posts_path

      expect(page).to have_text(/Foo|Bar/)
    end

    it "cannot see other users posts" do
      user = create :other_user
      new_post = create :post, user: user, rationale: "Whatever"

      visit posts_path

      expect(page).to_not have_text new_post.rationale
    end
  end

  describe "new" do
    it "has a link from homepage" do
      visit root_path
      click_link("new_post_from_nav")

      expect(status_code).to eq 200
    end
  end

  describe "delete" do
    it "can be deleted" do
      post
      visit posts_path
      click_link("delete_#{post.id}")

      expect(status_code).to eq 200
    end
  end

  describe "create" do
    before { visit new_post_path }

    it "has a new form that can be reached" do
      expect(status_code).to eq 200
    end

    it "can be created from new form page" do
      fill_in "post[date]", with: Time.zone.today
      fill_in "post[rationale]", with: "foo"
      click_on "Save"

      expect(page).to have_text "foo"
    end

    it "will have a user associated with it" do
      fill_in "post[date]", with: Time.zone.today
      fill_in "post[rationale]", with: "bar"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq "bar"
    end
  end

  describe "edit" do
    it "can be edited" do
      visit edit_post_path(post)
      fill_in "post[date]", with: Time.zone.today
      fill_in "post[rationale]", with: "baz"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq "baz"
    end

    it "cannot be edited by a non authorized user" do
      logout(:user)
      user = create :other_user
      login_as user, scope: :user

      visit edit_post_path(post)

      expect(current_path).to eq root_path
    end
  end
end
