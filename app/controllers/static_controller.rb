# frozen_string_literal: true
# no doc
class StaticController < ApplicationController
  def homepage
    @pending_approvals = Post.pending_approvals
  end
end
