# frozen_string_literal: true
require "rails_helper"

describe "posts" do
  before do
    @user = create :user
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
      create :post
      create :second_post
      visit posts_path
      expect(page).to have_text(/Foo|Bar/)
    end
  end

  describe "new" do
    it "has a link from homepage" do
      visit root_path
      click_link("new_post_from_nav")

      expect(status_code).to eq 200
    end
  end

  describe "create" do
    before do
      visit new_post_path
    end

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
    before { @post = create :post }
    it "can be reached by clicking edit on index page" do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(status_code).to eq 200
    end

    it "can be edited" do
      visit edit_post_path(@post)
      fill_in "post[date]", with: Time.zone.today
      fill_in "post[rationale]", with: "baz"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq "baz"
    end
  end
end
