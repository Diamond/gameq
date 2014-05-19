class RemoveCompletedFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :completed
  end
end
