# frozen_string_literal: true
# no doc
class Post < ApplicationRecord
  validates :date, :rationale, presence: true
  belongs_to :user
end
