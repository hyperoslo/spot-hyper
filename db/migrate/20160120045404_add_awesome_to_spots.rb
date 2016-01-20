class AddAwesomeToSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :awesome, :boolean, default: false
    add_index :spots, :awesome
  end
end
