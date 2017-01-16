# frozen_string_literal: true
# no doc
class AuditLog < ApplicationRecord
  belongs_to :user
end
