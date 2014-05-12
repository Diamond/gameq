class AddConsoleIdToGames < ActiveRecord::Migration
  def up
    add_column :games, :console_id, :integer
  end

  def down
    remove_column :games, :console_id
  end
end
