# frozen_string_literal: true
# no doc
class PostPolicy < ApplicationPolicy
  def approve?
    admin?
  end

  def update?
    return true if post_approved? && admin?
    return true if user_or_admin && !post_approved?
  end

  private

  def user_or_admin
    record.user == user || admin?
  end

  def admin?
    admin_types.include?(user.type)
  end

  def post_approved?
    record.approved?
  end
end
