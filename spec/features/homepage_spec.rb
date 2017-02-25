# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Homepage" do
  describe "Admin" do
    scenario "approves post from the homepage" do
      post = create :post
      admin_user = create :admin_user
      login_as admin_user, scope: :user

      visit root_path

      click_on "approve_#{post.id}"

      expect(post.reload.status).to eq "approved"
    end
  end
end
