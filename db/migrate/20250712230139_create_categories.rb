class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end