class DynamicField < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :data_type, presence: true, acceptance: { accept: ["string", "date"] }
end
