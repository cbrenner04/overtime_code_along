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
end
