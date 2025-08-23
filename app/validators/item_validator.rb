class ItemValidator < ActiveModel::Validator
  # this validation actualy exists on rails 7, so this must be refactored once rails is uptaded to 7+
  def validate(record)
    used_keys = record.fields.keys
    possible_fields = Category.last.dynamic_fields.pluck(:name)

    record.errors.add :fields, 'Invilid field key detected' if possible_fields.union(used_keys).length != possible_fields.length

    record.category.dynamic_fields.each do |field|
      content = record.fields[field.name]
      record.errors.add :fields, "Invalid field: #{field.name}" unless field.validate(content)
    end
  end
end
