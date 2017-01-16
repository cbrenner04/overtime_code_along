# frozen_string_literal: true
require "rails_helper"

feature "Approval Workflow" do
  before do
    @admin_user = create :admin_user
    login_as @admin_user, scope: :user
  end

  describe "edit" do
    before { @post = create :post }

    it "has a status that can be edited on the form" do
      visit edit_post_path(@post)

      choose "Approved"
      click_on "Save"

      expect(@post.reload.status).to eq("approved")
    end
  end
end
