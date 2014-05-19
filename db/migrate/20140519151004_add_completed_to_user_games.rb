class AddCompletedToUserGames < ActiveRecord::Migration
  def change
    add_column :user_games, :completed, :boolean
  end
end
