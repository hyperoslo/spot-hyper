class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.text :text
      t.string :user_name
      t.integer :user_id
      t.string :tags, array: true, default: []
      t.timestamps
    end
    add_index  :spots, :tags, using: 'gin'
  end
end
