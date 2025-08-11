class AddTypeToDynamicField < ActiveRecord::Migration[6.1]
  def change
    add_column :dynamic_fields, :data_type, :string
  end
end
