# frozen_string_literal: true
# no doc
class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all
    authorize @audit_logs
  end
end
