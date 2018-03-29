class AddSelectedToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :selected, :tinyint, null: false
  end
end
