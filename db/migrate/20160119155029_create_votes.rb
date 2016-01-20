class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :spot, index: true, foreign_key: true
      t.string :ip

      t.timestamps
    end
    add_index :votes, :ip
  end
end
