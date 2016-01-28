class CreateHangouts < ActiveRecord::Migration[5.0]
  def change
    create_table :hangouts do |t|
      t.string :url
      t.string :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
