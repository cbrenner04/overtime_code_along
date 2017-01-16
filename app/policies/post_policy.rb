# frozen_string_literal: true
# no doc
class PostPolicy < ApplicationPolicy
  def update?
    record.user == user || admin_types.include?(user.type)
  end
end
