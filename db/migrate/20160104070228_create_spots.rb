class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :location
      t.text :text
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
