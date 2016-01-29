class AddIndexToUsername < ActiveRecord::Migration[5.0]
  def change
    add_index :hangouts, :user_name
  end
end
