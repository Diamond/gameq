class UserGame < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  delegate :name, to: :game

  def self.add_game_for_user(game, user, completed)
    return false unless game.valid? && user.valid?
    UserGame.create(game_id: game.id, user_id: user.id, completed: completed)
  end
end
