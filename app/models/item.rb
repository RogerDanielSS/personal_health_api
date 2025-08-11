class Item < ApplicationRecord
  belongs_to :category  

  validates_with ItemValidator

  private

  def validate_fields_format
    required_fields = category.dynamic_fields.pluck(:name)
    missing_fields = required_fields - fields.keys
    errors.add(:fields, "está faltando os campos: #{missing_fields.join(', ')}") unless missing_fields.empty?
  end
end
