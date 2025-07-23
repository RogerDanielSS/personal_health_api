class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items
  has_many :dynamic_fields
  accepts_nested_attributes_for :dynamic_fields, allow_destroy: true

  scope :items, -> {
    all.flat_map(&:items)
  }
end
