# frozen_string_literal: true
# no doc
class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  validates :date, :rationale, presence: true
  belongs_to :user
end
