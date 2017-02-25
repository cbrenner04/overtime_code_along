# frozen_string_literal: true
# no doc
class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  validates :date, :rationale, :overtime_request, presence: true
  validates :overtime_request, numericality: { greater_than: 0.0 }
  belongs_to :user

  scope :posts_by, ->(user) { where(user: user) }
end
