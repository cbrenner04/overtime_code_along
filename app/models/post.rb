# frozen_string_literal: true
# no doc
class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  validates :date, :rationale, :overtime_request, presence: true
  validates :overtime_request, numericality: { greater_than: 0.0 }
  belongs_to :user

  scope :posts_by, ->(user) { where(user: user) }

  after_save :confirm_audit_log, if: :submitted?
  after_save :un_confirm_audit_log, if: :rejected?

  private

  def confirm_audit_log
    audit_log = AuditLog.where(
      user_id: user_id,
      start_date: (date - 7.days..date)
    ).last
    audit_log&.confirmed!
  end

  def un_confirm_audit_log
    audit_log = AuditLog.where(
      user_id: user_id,
      start_date: (date - 7.days..date)
    ).last
    audit_log&.pending!
  end
end
