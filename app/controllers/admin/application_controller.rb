# frozen_string_literal: true
# no doc
module Admin
  def self.admin_types
    ["AdminUser"]
  end

  # controller for admin dashboard
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      return if Admin.admin_types.include? current_user.try(:type)
      flash[:alert] = "You are not authorized to access this page"
      redirect_to root_path
    end
  end
end
