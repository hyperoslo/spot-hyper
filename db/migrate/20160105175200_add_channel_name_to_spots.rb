class AddChannelNameToSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :channel_name, :string
  end
end
