class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.json :fields, default: {}
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
