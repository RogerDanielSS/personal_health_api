class DynamicField < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
end
