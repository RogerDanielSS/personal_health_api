class CreateDynamicFields < ActiveRecord::Migration[6.1]
  def change
    create_table :dynamic_fields do |t|

      t.timestamps
    end
  end
end
