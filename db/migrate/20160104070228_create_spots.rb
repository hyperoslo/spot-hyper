class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :text
      t.string :user_name
      t.integer :user_id
      t.text :tags, array: true, default: []
      t.timestamps
    end
  end
end
