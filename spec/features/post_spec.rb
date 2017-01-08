# frozen_string_literal: true
require "rails_helper"

describe "posts" do
  describe "index" do
    before { visit posts_path }

    it "can be reached successfully" do
      expect(status_code).to eq 200
    end

    it "has a title of Posts" do
      expect(page).to have_text "Posts"
    end
  end

  describe "creation" do
    before { visit new_post_path }

    it "has a new form that can be reached" do
      expect(status_code).to eq 200
    end

    it "can be created from new form page" do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "foo"
      click_on "Save"

      expect(page).to have_text "foo"
    end
  end
end
