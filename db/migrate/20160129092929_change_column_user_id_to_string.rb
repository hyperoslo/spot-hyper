class ChangeColumnUserIdToString < ActiveRecord::Migration[5.0]
  def change
    change_column :hangouts, :user_id, :string, index: true
  end
end
