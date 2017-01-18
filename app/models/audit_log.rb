# frozen_string_literal: true
# no doc
class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 1 }

  belongs_to :user

  validates :user, :start_date, :status, presence: true

  after_initialize :set_defaults

  private

  def set_defaults
    self.start_date ||= Time.zone.today - 6.days
  end
end
