class CreateDynamicFields < ActiveRecord::Migration[6.1]
  def change
    create_table :dynamic_fields do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
