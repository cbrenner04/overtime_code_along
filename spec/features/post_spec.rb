# frozen_string_literal: true
require "rails_helper"

describe "posts" do
  describe "index" do
    it "can be reached successfully" do
      visit posts_path
      expect(status_code).to eq 200
    end

    it "has a title of Posts" do
      visit posts_path
      expect(page).to have_text "Posts"
    end
  end

  describe "creation" do
    it "has a new form that can be reached" do
      visit new_post_path
      expect(status_code).to eq 200
    end

    it "can be created from new form page" do
      visit new_post_path
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "foo"
      click_on "Save"
      expect(page).to have_text "foo"
    end
  end
end
