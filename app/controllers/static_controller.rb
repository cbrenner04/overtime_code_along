# frozen_string_literal: true
# no doc
class StaticController < ApplicationController
  def homepage
    @pending_approvals = Post.pending_approvals
    @recent_audit_items = AuditLog.last(10)
  end
end
