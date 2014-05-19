class GameTag < ActiveRecord::Base
  before_create :set_default_score

  belongs_to :game
  belongs_to :tag

  def increase_score
    self.score = (self.score || 0) + 1
    self.save
    self
  end

  def self.add_tag_for_game(tag, game)
    return false unless tag.present? && game.present?
    gt = self.first_or_create(tag_id: tag.id, game_id: game.id)
    gt.increase_score
    gt
  end

  protected
  def set_default_score
    self.score = self.score || 0 
  end
end
