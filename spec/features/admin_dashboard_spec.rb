# frozen_string_literal: true
require "rails_helper"

feature "Admin Dashboard" do
  it "does not allow users to access without being signed in" do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  context "when user is not an admin" do
    it "cannot be reached" do
      user = create :user
      login_as user, scope: :user

      visit admin_root_path

      expect(current_path).to eq(root_path)
    end
  end

  context "when user is an admin" do
    it "can be reached" do
      user = create :admin_user
      login_as user, scope: :user

      visit admin_root_path

      expect(current_path).to eq(admin_root_path)
    end
  end
end
