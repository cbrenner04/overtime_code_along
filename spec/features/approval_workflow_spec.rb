# frozen_string_literal: true
require "rails_helper"

feature "Approval Workflow" do
  before do
    @admin_user = create :admin_user
    login_as @admin_user, scope: :user
  end

  describe "edit" do
    let(:post) { create :post }

    it "has a status that can be edited on the form by an admin" do
      visit edit_post_path(post)

      choose "Approved"
      click_on "Save"

      expect(post.reload.status).to eq("approved")
    end

    it "cannot be edited by a non admin" do
      logout(:user)
      user = create :user
      login_as user, scope: :user

      visit edit_post_path(post)

      expect(page).to_not have_content "Approved"
    end

    it "should not be editable by the creator if post has been approved" do
      logout(:user)
      user = create :user
      post = create :post, user: user, status: "approved"

      login_as user, scope: :user
      visit edit_post_path(post)

      expect(current_path).to eq root_path
    end
  end
end
