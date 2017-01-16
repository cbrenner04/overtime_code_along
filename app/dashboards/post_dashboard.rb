require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    date: Field::DateTime,
    rationale: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :date,
    :rationale
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :date,
    :rationale,
    :created_at,
    :updated_at
  ].freeze

  FORM_ATTRIBUTES = [
    :user,
    :date,
    :rationale
  ].freeze
end
