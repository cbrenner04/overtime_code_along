# frozen_string_literal: true
require "rails_helper"

feature "Audit Log" do
  let(:audit_log) { create :audit_log }
  let(:admin_user) { create :admin_user }

  before { login_as(admin_user, scope: :user) }

  describe "index" do
    it "is reachable" do
      visit audit_logs_path

      expect(status_code).to eq(200)
    end

    it "renders audit log content" do
      audit_log
      visit audit_logs_path

      expect(page).to have_text(/BAR, FOO/)
    end

    it "cannot be accessed by non admin" do
      logout(:user)
      user = create :user
      login_as(user, scope: :user)
      visit audit_logs_path

      expect(current_path).to eq root_path
    end
  end
end
