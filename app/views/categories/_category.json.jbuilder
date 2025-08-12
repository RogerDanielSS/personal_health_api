json.extract! category, :id, :name

json.dynamic_fields category.dynamic_fields, partial: 'dynamic_fields/dynamic_field', as: :dynamic_field