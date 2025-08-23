class DynamicField < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :data_type, presence: true, acceptance: { accept: ['string', 'date', 'number'] }

  def validate(content)
    case data_type
    when 'string'
      return true
    when 'date'
      Date.parse(content).class == Date
    when 'number'
      content.to_f.to_s == content || content.to_i.to_s == content
    end
  end
end
