# frozen_string_literal: true
require "rails_helper"

RSpec.describe AuditLog, type: :model do
  before { @audit_log = create :audit_log }

  describe "creation" do
    it "can be created" do
      expect(@audit_log).to be_valid
    end
  end

  describe "validations" do
    it "is invalid when no user" do
      @audit_log.user = nil

      expect(@audit_log).to_not be_valid
    end

    it "is invalid when no status" do
      @audit_log.status = nil

      expect(@audit_log).to_not be_valid
    end

    it "is invalid when no start_date" do
      @audit_log.start_date = nil

      expect(@audit_log).to_not be_valid
    end

    it "has start_date equal to 6 days ago" do
      new_audit_log = AuditLog.create(user: User.last)

      expect(new_audit_log.start_date).to eq Time.zone.today - 6.days
    end
  end
end
