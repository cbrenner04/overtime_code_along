# frozen_string_literal: true
# no doc
class StaticController < ApplicationController
  def homepage
    if current_user.admin?
      @pending_approvals = Post.submitted
      @recent_audit_items = AuditLog.last(10)
    else
      @pending_audit_confirmations = current_user.audit_logs
    end
  end
end
