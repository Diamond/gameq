class GameTag < ActiveRecord::Base
  belongs_to :game
  belongs_to :tag

  def increase_score
    self.score = (self.score || 0) + 1
    self.save
  end

  def self.add_tag_for_game(tag, game)
    gt = self.first_or_create(tag_id: tag.id, game_id: game.id)
    gt.increase_score
  end
end
