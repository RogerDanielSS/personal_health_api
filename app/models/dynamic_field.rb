class DynamicField < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :data_type, presence: true, acceptance: { accept: ['string', 'date', 'float'] }

  def validate(content)
    case data_type
    when 'string'
      return true
    when 'date'
      Date.parse(content).class == Date
    when 'float'
      content.to_f.to_s == content
    end
  end

  def decimal?(str)
    str.match?(/^\d*\.?\d+$|^\d+\.\d*$/)
  end
end
